#creat vpc
resource "aws_vpc" "vpc-ec2-public" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-ec2-public"
  }
}
#creat subnet 
resource "aws_subnet" "subnet-public" {
  vpc_id     = aws_vpc.vpc-ec2-public.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-public"
  }
}
#creat  Internet Gateway
resource "aws_internet_gateway" "week4-igw" {
  vpc_id = aws_vpc.vpc-ec2-public.id

  tags = {
    Name = "week4-igw-publicsubnet"
  }
}

#creat Route Table
resource "aws_route_table" "route_table_week4" {
  vpc_id = aws_vpc.vpc-ec2-public.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.week4-igw.id
  }

  tags = {
    Name = "route_table_week4"
  }
}

resource "aws_route_table_association" "main-week4" {
  subnet_id      = aws_subnet.subnet-public.id
  route_table_id = aws_route_table.route_table_week4.id
}

#creat Security Group
resource "aws_security_group" "allow_ssh" {
  vpc_id = aws_vpc.vpc-ec2-public.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
