resource "aws_s3_bucket" "artifact" {
  #checkov:skip=CKV_AWS_18:Ensure the S3 bucket has access logging enabled

  bucket = "artifact-teamcity-${data.aws_caller_identity.current.account_id}"
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }


  tags = var.common_tags
}
