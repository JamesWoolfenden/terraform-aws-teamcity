module "teamcity" {
  source          = "../../"
  instance_type   = var.instance_type
  vpc_id          = var.vpc_id
  key_name        = var.key_name
  ami_id          = data.aws_ami.amazon.id
  common_tags     = var.common_tags
  private_subnets = data.aws_subnet_ids.private.ids
  public_subnets  = data.aws_subnet_ids.public.ids
  listeners = [
    {
      instance_port      = 8111
      instance_protocol  = "http"
      lb_port            = 80
      lb_protocol        = "http"
      ssl_certificate_id = ""
    }

  ]
}
