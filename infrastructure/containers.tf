resource "aws_ecr_repository" "backend" {
  name                 = var.ecr-repo-name
  image_tag_mutability = "MUTABLE"
}

