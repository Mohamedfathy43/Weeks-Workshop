#creat subnet 
resource "aws_subnet" "subnet-01" {
  vpc_id            = aws_vpc.vpc-01.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "subnet-02" {
  vpc_id            = aws_vpc.vpc-01.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1b"
}

# Create Internet gateway
resource "aws_internet_gateway" "igw-0" {
    vpc_id = aws_vpc.vpc-01.id
    tags = {
      Name = "igw-0"
    }
}

# Create a route table
resource "aws_route_table" "rt-1" {
  vpc_id = aws_vpc.vpc-01.id

  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_internet_gateway.igw-0.id
  }
}

# route table association subnet 01
resource "aws_route_table_association" "rt-1a" {
  subnet_id = aws_subnet.subnet-01.id
  route_table_id = aws_route_table.rt-1.id
}

# route table association subnet 02
resource "aws_route_table_association" "rt-2b" {
  subnet_id = aws_subnet.subnet-02.id
  route_table_id = aws_route_table.rt-1.id
}