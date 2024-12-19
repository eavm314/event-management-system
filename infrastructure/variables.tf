variable "bucket_name" {
  description = "The name of the S3 bucket fr storage"
}

variable "ecr_repo_name" {
  description = "The name of the ECR repository"
}

variable "db_name" {
  description = "The name of the database"
  default = "event_management_db"
}

variable "cluster_name" {
  description = "The name of the ECS cluster"
  default = "event-management-system-cluster"
}