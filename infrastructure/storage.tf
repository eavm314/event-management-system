resource "aws_s3_bucket" "ems_bucket" {
  bucket = var.bucket_name
  
  tags = {
    Project     = "Event Management System"
    Description = "This bucket is used to store images for the Frontend Application"
    Environment = "production"
  }
}