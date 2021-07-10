resource "aws_ecs_cluster" "ecs_cluster" {
  name               = "my-ecs-fargate"
  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

  tags = {
    Environment = "prod"
  }
}