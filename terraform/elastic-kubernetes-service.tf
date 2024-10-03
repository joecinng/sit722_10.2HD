resource "aws_eks_cluster" "eks" {
  name             = var.app_name
  version          = "1.27" 
  vpc_config {
    subnet_ids = split(",", var.SUBNET_IDS)
    security_group_ids = split(",", var.SECURITY_GROUP_IDS)
  }

  role_arn = var.EKS_CLUSTER_ROLE_ARN
}

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "${var.app_name}-node-group"
  node_role_arn   = var.EKS_NODE_ROLE_ARN
  subnet_ids = split(",", var.SUBNET_IDS)

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  instance_types = ["t3.medium"]

}
