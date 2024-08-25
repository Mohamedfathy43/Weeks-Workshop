resource "aws_secretsmanager_secret" "rds_master_password" {
  name = "rds-master-password"
}


resource "aws_secretsmanager_secret_version" "rds_master_password_version" {
  secret_id     = aws_secretsmanager_secret.rds_master_password.id
  secret_string = "2469Ms92Nd"
}
