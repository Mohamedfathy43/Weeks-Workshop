resource "aws_instance" "bastion" {
  ami           = "ami-0ba9883b710b05ac6"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  key_name      = "weeksix"
  tags = {
    Name = "BastionHost"
  }

  security_groups = [aws_security_group.bastion_sg.id]
}
