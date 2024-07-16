resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds_subnet_group"
  subnet_ids = [
    aws_subnet.subnet-01.id,
    aws_subnet.subnet-02.id
  ]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "db-01" {
  allocated_storage    = 20
  identifier           = "my-postgresql-db" 
  db_name              = "rds_postgress_DB1"
  engine               = "postgres"
  engine_version       = "15.4"
  instance_class       = "db.t3.micro"
  username             = "postgres"
  password             = "postgres"
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.sg-01.id]
  skip_final_snapshot  = true
  tags = {
    Name = "rds_postgress_DB"
  }

}


