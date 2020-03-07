#
# Variables Configuration
#

variable "cluster-name" {
  default = "terraform-eks-demo"
  type    = string
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
