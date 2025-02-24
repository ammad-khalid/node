# ECR Repo for Dev and Stage Environments

# Local variables for multiple repositories
locals {
  ecr_repositories = [

# node Aplication
    {
      name = "node"
      tags = {
        Service     = "node"
        
      }
    }
  ]
}

# Create ECR Repositories
resource "aws_ecr_repository" "repos" {
  for_each             = { for repo in local.ecr_repositories : repo.name => repo }
  name                 = each.value.name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = each.value.tags
}

# Create Lifecycle Policies for Repositories
resource "aws_ecr_lifecycle_policy" "retention_policies" {
  for_each = { for repo in local.ecr_repositories : repo.name => repo }

  repository = aws_ecr_repository.repos[each.key].name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep last 5 images, expire old images"
        selection = {
          tagStatus     = "any"
          countType     = "imageCountMoreThan"
          countNumber   = 5
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}