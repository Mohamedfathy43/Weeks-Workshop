resource "aws_instance" "bastion" {
  ami           = "ami-066784287e358dad1"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  key_name      = "weeksix"
  tags = {
    Name = "BastionHost"
  }
  user_data = <<-EOF
             #!/bin/bash
             sudo dnf install -y postgresql15 postgresql15-server
             sudo postgresql-setup --initdb
             sudo systemctl start postgresql
             sudo systemctl enable postgresql
             EOF

  security_groups = [aws_security_group.bastion_sg.id]
}







