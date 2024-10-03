# Sets global variables for this Terraform project.

variable "app_name" {
  default = "sit722_10_2hd_terraform"
}

variable "kubernetes_version" {    
  description = "The version of Kubernetes to use"
  default     = "1.30.2"
}

variable "AWS_ACCESS_KEY_ID" {
  description = "Access key"
  type        = string  
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "Secret access key"
  type        = string
}

variable "SUBNET_IDS" {
  description = "Comma-separated list of subnet IDs where the EKS cluster will be deployed"
  type        = string
}

locals {
  subnet_ids_list = split(",", var.SUBNET_IDS)
}

variable "EKS_CLUSTER_ROLE_ARN" {
  description = "The IAM role ARN for the EKS control plane"
  type        = string
}

variable "EKS_NODE_ROLE_ARN" {
  description = "The IAM role ARN for the EKS node group"
  type        = string
}

variable "SECURITY_GROUP_IDS" {
  description = "Comma-separated list of security group IDs for the EKS cluster"
  type        = string
}

locals {
  security_group_ids_list = split(",", var.SECURITY_GROUP_IDS)
}
