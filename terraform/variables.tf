variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
  default     = "eks-demo-cluster"
}

variable "node_instance_type" {
  description = "EC2 instance type for node group"
  type        = string
  default     = "t2.medium"
}
