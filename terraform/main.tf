module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name = "eks-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["${var.aws_region}a", "${var.aws_region}b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = local.tags
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.3"

  cluster_name    = var.cluster_name
  cluster_version = "1.32"
  subnet_ids      = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  eks_managed_node_groups = {
    default = {
      instance_types = [var.node_instance_type]
      desired_size   = 2
      max_size       = 3
      min_size       = 1

      tags = {
        Name = "eks-node-group"
      }
    }
  }

  tags = local.tags
}