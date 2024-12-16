resource "aws_s3_bucket" "ems_bucket" {
  bucket = var.bucket_name
  
  tags = {
    Project     = "Event Management System"
    Description = "This bucket is used to store images for the Frontend Application"
    Environment = "production"
  }
}

resource "aws_s3_bucket_public_access_block" "bucket_public_access" {
  bucket = aws_s3_bucket.ems_bucket.id
}

resource "aws_s3_bucket_policy" "bucket_public_policy" {
  bucket = aws_s3_bucket.ems_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.ems_bucket.arn}/*"
      }
    ]
  })
}