resource "aws_internet_gateway" "dev_igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "dev-cle-igw"
  }
}
