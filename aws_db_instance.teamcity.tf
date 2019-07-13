resource "aws_db_instance" "teamcity" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7.11"
  instance_class         = "db.t2.small"
  name                   = "teamcity"
  password               = random_string.dbpassword.result
  username               = "teamcity"
  vpc_security_group_ids = [aws_security_group.rds_security_group.id]

  db_subnet_group_name = aws_db_subnet_group.teamcity.name

  tags = var.common_tags
}
