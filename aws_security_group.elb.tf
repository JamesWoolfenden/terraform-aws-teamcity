resource "aws_security_group" "elb" {
  name        = "teamcity-elb"
  vpc_id      = var.vpc_id
  description = "Protects ELB access"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "http access"
    # tfsec:ignore:AWS008
    cidr_blocks = var.elb-whitelist
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    description = "SSL access"
    # tfsec:ignore:AWS008
    cidr_blocks = var.elb-whitelist
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    description = "Allow outbound"
    # tfsec:ignore:AWS009
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.common_tags
}
