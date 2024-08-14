resource "aws_key_pair" "dev_key_pair" {
  for_each = toset(var.key_names)
  key_name   = "dev-cle-${each.value}-key"
  public_key = file("ssh/${each.value}.pub")
}
