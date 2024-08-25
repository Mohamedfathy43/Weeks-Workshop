resource "aws_db_subnet_group" "main" {
  name       = "mydb_subnet_group"
  subnet_ids = [aws_subnet.private_b.id, aws_subnet.private_e.id]

  tags = {
    Name = "My DB subnet group"
  }
}


resource "aws_db_instance" "main" {
  allocated_storage        = 20
  storage_type             = "gp2"
  engine                   = "postgres"
  engine_version           = "15.4"
  instance_class           = "db.t3.micro"
  identifier               = "my-postgresql-db"
  username                 = "postgres"
  password                 = "aws_secretsmanager_secret_version.rds_master_password_version.secret_string"
  multi_az                 = true
  skip_final_snapshot      = true
  db_name                  = "mydatabase"
  vpc_security_group_ids   = [aws_security_group.rds_sg.id]
  db_subnet_group_name     = aws_db_subnet_group.main.name
  backup_retention_period  = 7
  copy_tags_to_snapshot    = true
  delete_automated_backups = true
  apply_immediately = false
  publicly_accessible  = false
  storage_encrypted    = true
  blue_green_update {
    enabled = true
  }

tags = {
    Name = "myrdsinstance"
  }

}
