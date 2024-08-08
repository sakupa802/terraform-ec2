variable "instance_type" {
  description = "The EC2 instance type"
  default     = "t3.medium"
}

// 作成するEC2インスタンスのユーザ名のリスト
variable "instance_user_names" {
  description = "The list of user names for whom the EC2 instances are being created"
  type        = list(string)
  default = ["user1"]
}
