variable "aws_region" {
  description = "The AWS region"
  default = "ap-northeast-1"
}

# instance tagとkey pairの名前に利用するユーザ名
variable "user_names" {
  type = list(string)
  default = ["aaa-bbb", "ccc-ddd"]
}

variable "public_key_path" {
  description = "The path to the public key"
  default = "~/.ssh/id_rsa.pub"
}

variable "subnet_id" {
  description = "The subnet ID to use for the EC2 instance"
}

variable "security_group_id" {
  description = "The security group ID to use for the EC2 instance"
}

variable "kms_key_id" {
  description = "The KMS key ID to use for the EC2 instance"
  type = string
}
