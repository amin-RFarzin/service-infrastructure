data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "cloudFront_accesLog" {
  bucket = join("-", [
    "cloudfront_access_logs",
    data.aws_caller_identity.current.account_id])

  acl = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
      }
    }
  }
}
