resource "aws_ecr_repository" "sit722_ecr" {
  name                 = var.app_name
  image_tag_mutability = "MUTABLE"
}
