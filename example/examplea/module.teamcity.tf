module "teamcity" {
  source          = "../../"
  instance_type   = var.instance_type
  ssl_cert_arn    = var.ssl_cert_arn
  vpc_id          = var.vpc_id
  key_name        = var.key_name
  ami_id          = ""
  common_tags     = var.common_tags
  private_subnets = data.aws_subnet_ids.private
  public_subnets  = data.aws_subnet_ids.public
}
