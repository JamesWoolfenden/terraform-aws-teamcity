data "aws_subnet_ids" "private" {
  vpc_id = var.vpc_id

  tags = {
    Type = "Private"
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = var.vpc_id

  tags = {
    Type = "Public"
  }
}
