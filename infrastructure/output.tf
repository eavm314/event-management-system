output "ecr-repo-url" {
  description = "The URL of the ECR repository"
  value       = aws_ecr_repository.backend.repository_url 
}

output "rds-endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.mysql-server.endpoint
}