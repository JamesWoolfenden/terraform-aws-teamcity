data "aws_subnet_ids" "private" {
  vpc_id = var.vpc_id

  tags = {
    Type = "Public"
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = var.vpc_id

  tags = {
    Type = "Public"
  }
}
