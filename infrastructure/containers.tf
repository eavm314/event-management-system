resource "aws_ecr_repository" "backend" {
  name                 = var.ecr-repo-name
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecs_task_definition" "task_definition" {
  family                   = "event-management-system-backend"
  network_mode             = "awsvpc"
  memory                   = "512"
  requires_compatibilities = ["FARGATE"]


  execution_role_arn = "arn:aws:iam::975050345788:role/ecsInstanceRole"

  # Container definition
  container_definitions = jsonencode([
    {
      name   = "event-management-system-backend"
      image  = "${aws_ecr_repository.backend.repository_url}:latest"
      cpu    = 256
      memory = 512
      port_mappings = [
        {
          container_port = 9000
          host_port      = 9000
          protocol       = "tcp"
        }
      ]
      environment = [
        {
          name  = "DB_URL"
          value = "jdbc:mysql://${var.db-username}:${var.db-password}@${aws_db_instance.mysql-server.endpoint}/${var.db-name}"
        }
      ],
    }
  ])

  # Defining the task-level CPU
  cpu = "256"
}

# ECS service
resource "aws_ecs_cluster" "ecs_cluster" {
  name = "event-management-system-cluster"
  tags = {
    Project     = "Event Management System"
    Description = "This cluster is used to run the Backend Server"
    Environment = "production"
  }
}

resource "aws_ecs_service" "service" {
  name            = "backend-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.task_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = data.aws_subnet_ids.existing.ids
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }
}
