instance_type = "t2.micro"
key_name      = "teamcity"
vpc_id        = "vpc-0c33dc8cd64f408c4"
common_tags = {
  Function  = "CI/CD"
  createdby = "Terraform"
  module    = "terraform-aws-teamcity"
}
