variable "instance_type" {
  description = "The EC2 instance type"
  default     = "t3.medium"
}

variable "subnet_id" {
  description = "The subnet ID to use for the EC2 instance"
  type = string
}

variable "security_group_id" {
  description = "The security group ID to use for the EC2 instance"
  type = string
}

variable "volume_type" {
  description = "The volume type for the EC2 instance"
  default     = "gp3"
}

variable "volume_size" {
  description = "The volume size for the EC2 instance"
  default     = 20
}

variable "instance_tags" {
  description = "The tags for the EC2 instance"
}

variable "kms_key_id" {
  type = string
}
