resource "aws_security_group" "rds" {
  count       = var.need_db
  description = "Allow inbound traffic from Teamcity server"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "TCP"
    security_groups = [aws_security_group.teamcity.id]
    description     = "Only let the TC server connect"
  }

  egress {
    description = "Allow outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    # tfsec:ignore:AWS009
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.common_tags
}

resource "aws_db_subnet_group" "teamcity" {
  count      = var.need_db
  subnet_ids = var.private_subnets
  tags       = var.common_tags
}
