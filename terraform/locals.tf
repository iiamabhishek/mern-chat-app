locals {
  environment = "dev"

  tags = {
    Terraform   = "true"
    Environment = local.environment
  }
}