resource "aws_instance" "dev_instance" {
  for_each      = toset(var.instance_user_names)
  ami           = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.dev_sg.id]

  tags = {
    Name = "${each.key}-dev-instance"
  }

  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
    kms_key_id  = "alias/aws/ebs"
    encrypted   = true
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Instance created by ${each.key}'"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }
}
