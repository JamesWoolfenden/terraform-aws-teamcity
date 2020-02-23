resource "aws_security_group" "teamcity" {
  description = "Terraform security group"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    description = "RDP"
    cidr_blocks = var.whitelist
  }

  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    description = "Agent port"
    cidr_blocks = var.whitelist
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    description     = "ui"
    security_groups = [aws_security_group.elb.id]
    cidr_blocks     = var.whitelist
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "SSH"
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
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.common_tags
}
