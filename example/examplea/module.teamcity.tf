module "teamcity" {
  source                      = "../../"
  ami_id                      = data.aws_ami.amazon.image_id
  associate_public_ip_address = false
  common_tags                 = var.common_tags
  instance_type               = var.instance_type
  key_name                    = var.key_name
  private_subnets             = data.aws_subnet_ids.private.ids
  public_subnets              = data.aws_subnet_ids.public.ids
  vpc_id                      = var.vpc_id
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
