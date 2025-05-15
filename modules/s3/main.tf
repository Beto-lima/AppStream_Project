resource "aws_s3_bucket" "appstream_bucket" {
  bucket = var.bucket_name
  
}

resource "aws_s3_bucket_lifecycle_configuration" "data_lifecycle" {
  bucket = aws_s3_bucket.appstream_bucket.id

  rule {
    id     = "ExpireOldObjects"
    status = "Enabled"

    expiration {
      days = 30
    }
  }
}
