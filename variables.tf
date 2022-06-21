variable "region" {
  type = string
  default = "us-east-2"
 }


variable "iam-role-name" {
  type = string
  default = "devopsthehardway-eks-iam-role"
 }


variable "cluster-name" {
  type = string
  default = "devopsthehardway-cluster"
 }

variable "subnet_id_1" {
  type = string
  default = "subnet-0049f25db9fdfa27c"
 }
 
variable "subnet_id_2" {
  type = string
  default = "subnet-047b032cd4dd787a1"
 }

#variable "instance" {
#  type = string
#  default = "t2.micro"
# }

variable "node_groups" {
  type = list(object({
    name           = string
    instance_types = list(string)
    ami_type       = string
    capacity_type  = string
    disk_size      = number
    scaling_config = object({
      desired_size = number
      min_size     = number
      max_size     = number
    })
    update_config = object({
      max_unavailable = number
    })
  }))
  default = [
    {
      name           = "t2-micro"
      instance_types = ["t2.micro"]
      ami_type       = "068257025f72f470d"
      capacity_type  = "ON_DEMAND"
      disk_size      = 8
      scaling_config = {
        desired_size = 2
        max_size     = 3
        min_size     = 1
      }
      update_config = {
        max_unavailable = 1
      }
    }
  ]   