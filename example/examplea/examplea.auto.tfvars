instance_type = "t2.micro"
key_name      = "teamcity"
vpc_id        = "vpc-06d5069b9ea456bc5"
common_tags = {
  Function  = "CI/CD"
  createdby = "Terraform"
  module    = "terraform-aws-teamcity"
}
