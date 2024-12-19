variable "bucket_name" {
  description = "The name of the S3 bucket fr storage"
}

variable "ecr-repo-name" {
  description = "The name of the ECR repository"
}

variable "db-name" {
  description = "The name of the database"
  default = "event_management_db"
}