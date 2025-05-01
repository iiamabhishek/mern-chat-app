output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "node_group_role_arn" {
  description = "Node group IAM role ARN"
  value       = module.eks.eks_managed_node_groups["default"].iam_role_arn
}

output "kubeconfig_details" {
  value = {
    endpoint                 = module.eks.cluster_endpoint
    ca_data                  = module.eks.cluster_certificate_authority_data
    cluster_name             = module.eks.cluster_name
  }
}