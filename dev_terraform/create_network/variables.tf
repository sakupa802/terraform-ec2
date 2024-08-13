variable "aws_region" {
  description = "The AWS region"
  default = "ap-northeast-1"
}

# security groupに許可するcidr_blocks
variable "cidr_blocks" {
  type = list(string)
  default = ["0.0.0.0/0"]
}
