#deploy S3
resource "aws_s3_bucket" "mybucket_week2" {
  bucket = "myweek2-devops-kitchen"
}

#define Versioning Enabled
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.mybucket_week2.id
  versioning_configuration {
    status = "Enabled"
  }
}

#deploy objects encryption 
resource "aws_s3_bucket_server_side_encryption_configuration" "S3_encryption" {
  bucket = aws_s3_bucket.mybucket_week2.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "SSE-S3"
    }

    bucket_key_enabled = true

  }
}
#deploy s3 lifecycle
resource "aws_s3_bucket_lifecycle_configuration" "aws_s3_bucket_lifecycle" {
  bucket = aws_s3_bucket.mybucket_week2.id

  rule {
    id = "expire object"
    expiration {
      days = 7
    }
    status = "Enabled"
  }
}








