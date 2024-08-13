resource "aws_route_table" "dev_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = "dev-cle-route-table"
  }
}

resource "aws_route_table_association" "dev_route_table_association" {
  subnet_id = var.subnet_id
  route_table_id = aws_route_table.dev_route_table.id
}
