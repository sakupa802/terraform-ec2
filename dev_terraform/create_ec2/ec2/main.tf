resource "aws_instance" "dev_instance" {
  for_each = toset(var.instance_tags)
  ami = data.aws_ami.image.id
  instance_type = var.instance_type
  key_name = "dev-cle-${each.key}-key"
  subnet_id = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "dev-cle-${each.key}"
  }

  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
    kms_key_id  = var.kms_key_id
    encrypted   = true
  }
}

resource "aws_eip" "eip" {
  for_each = toset(var.instance_tags)
  domain = "vpc"

  tags = {
    Name = "dev-cle-${each.key}-eip"
  }

  depends_on = [aws_instance.dev_instance]
}

resource "aws_eip_association" "eip_assoc" {
  for_each = toset(var.instance_tags)
  instance_id = aws_instance.dev_instance[each.key].id
  allocation_id = aws_eip.eip[each.key].id

  depends_on = [aws_instance.dev_instance]
}
