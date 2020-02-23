resource "aws_db_instance" "teamcity" {
  count                  = var.need_db
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7.11"
  instance_class         = "db.t2.small"
  name                   = "teamcity"
  password               = random_string.dbpassword.result
  username               = "teamcity"
  storage_encrypted      = true
  vpc_security_group_ids = [aws_security_group.rds.0.id]

  db_subnet_group_name = aws_db_subnet_group.teamcity.0.name

  tags = var.common_tags
}
