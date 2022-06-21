resource "aws_eks_node_group" "node-ec2" {
  cluster_name  = aws_eks_cluster.eks-cluster.name   
  node_group_name = "t2-micro-node_groups"
  node_role_arn  = aws_iam_role.workernodes.arn
  subnet_ids   = [var.subnet_id_1, var.subnet_id_2]
  
  scaling_config {
   desired_size = var.desired_size-node_groups
   max_size   = var.max_size-node_groups
   min_size   = var.min_size-node_groups
  } 

  ami_type       = var.ami_type-node_groups
  instance_types = var.instance_types-node_groups
  capacity_type  = var.capacity_type-node_groups
  disk_size      = var.disk_size-node_groups

  depends_on = [
   aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
   aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
   aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
 }
