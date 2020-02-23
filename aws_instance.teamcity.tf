resource "aws_instance" "teamcity" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.teamcity.key_name
  subnet_id     = element(var.private_subnets, 0)

  user_data = <<EOF
<powershell>
set-executionpolicy bypass
net user Administrator ${random_string.password.result}
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
choco install teamcity -y
</powershell>
EOF

  root_block_device {
    encrypted = true
  }

  vpc_security_group_ids = [aws_security_group.teamcity.id]
  tags                   = var.common_tags
}
