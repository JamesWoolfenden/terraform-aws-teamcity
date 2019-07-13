resource "aws_key_pair" "teamcity" {
  key_name   = var.key_name
  public_key = tls_private_key.teamcity.public_key_openssh
}

resource "tls_private_key" "teamcity" {
  algorithm = "RSA"
}

resource "local_file" "public_key_pem" {
  content  = tls_private_key.teamcity.public_key_pem
  filename = "id_rsa.pub"
}

resource "local_file" "private_key_pem" {
  content  = tls_private_key.teamcity.private_key_pem
  filename = "id_rsa"
}
