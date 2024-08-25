resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.vpc-01.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.vpc-01.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
}

resource "aws_subnet" "private_e" {
  vpc_id            = aws_vpc.vpc-01.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1e"
}