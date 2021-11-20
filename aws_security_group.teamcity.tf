resource "aws_security_group" "teamcity" {
  name        = "teamcity instance"
  description = "Terraform security group"
  vpc_id      = var.vpc_id


  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    description = "Agent port"
    # tfsec:ignore:AWS008
    cidr_blocks = var.whitelist
  }

  ingress {
    from_port       = 8111
    to_port         = 8111
    protocol        = "tcp"
    description     = "ui"
    security_groups = [aws_security_group.elb.id]
    # tfsec:ignore:AWS008
    cidr_blocks = var.whitelist
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "SSH"
    # tfsec:ignore:AWS008
    cidr_blocks = var.whitelist
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    description = "Allows traffic to those under group"
    self        = true
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
