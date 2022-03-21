# tfsec:ignore:AWS002
resource "aws_s3_bucket" "artifact" {
  # checkov:skip=CKV_AWS_18:Ensure the S3 bucket has access logging enabled
  # checkov:skip=CKV2_AWS_41: Skip access logging
  # checkov:skip=CKV_AWS_52: "Ensure S3 bucket has MFA delete enabled"
  # checkov:skip=CKV_AWS_144: Not required
  # checkov:skip=CKV_AWS_145: v4 legacy
  # checkov:skip=CKV_AWS_19: v4 legacy
  # checkov:skip=CKV_AWS_21: v4 legacy
  bucket = "artifact-teamcity-${data.aws_caller_identity.current.account_id}"

  tags = var.common_tags
}


resource "aws_s3_bucket_acl" "artifact" {
  bucket = aws_s3_bucket.artifact.bucket
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "artifact" {
  bucket = aws_s3_bucket.artifact.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = var.kms_key.id
    }
  }

}

resource "aws_s3_bucket_versioning" "artifact" {
  bucket = aws_s3_bucket.artifact.id
  versioning_configuration {
    status     = "Enabled"
    mfa_delete = "Disabled"
  }
}



resource "aws_s3_bucket_public_access_block" "artifacts" {
  bucket = aws_s3_bucket.artifact.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}
