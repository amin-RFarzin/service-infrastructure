data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "cloudfront_access_logs" {
  bucket = join("-", ["cloudfront-access-logs", data.aws_caller_identity.current.account_id])

  acl = "public-read-write"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }
}
