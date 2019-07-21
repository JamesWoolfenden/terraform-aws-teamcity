data "aws_subnet_ids" "private" {
  vpc_id = "${var.vpc_id}"

  tags = {
    Tier = "Private"
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = "${var.vpc_id}"

  tags = {
    Tier = "Public"
  }
}

data "aws_availability_zones" "available" {}
