variable "aws_region" {
  description = "The AWS region"
  default = "ap-northeast-1"
}

variable "user_names" {
  type = list(string)
  default = ["hiroki", "cle-ec2", "cle-ec2-2"]
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
