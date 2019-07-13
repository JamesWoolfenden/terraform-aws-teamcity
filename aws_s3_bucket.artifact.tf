resource "aws_s3_bucket" "artifact" {
  bucket = "artifact-teamcity-${data.aws_caller_identity.current.account_id}"
  acl    = "private"
  tags   = var.common_tags
}
