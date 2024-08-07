resource "aws_db_subnet_group" "main" {
  name       = "mydb_subnet_group"
  subnet_ids = [aws_subnet.private_a.id, aws_subnet.private_b.id]

  tags = {
    Name = "My DB subnet group"
  }
}


resource "aws_db_instance" "main" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "15.4"
  instance_class         = "db.t3.micro"
  identifier             = "my-postgresql-db"
  username               = "postgres"
  password               = "PASSWORD"
  multi_az               = true
  skip_final_snapshot    = true
  db_name               = "mydatabase" 
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
}

