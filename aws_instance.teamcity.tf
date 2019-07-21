resource "aws_instance" "teamcity" {
  ami               = var.ami_id
  availability_zone = data.aws_availability_zones.available.names[0]
  instance_type     = var.instance_type
  key_name          = aws_key_pair.teamcity.key_name
  subnet_id         = element(data.aws_subnet_ids.private, 0)

  user_data = <<EOF
<powershell>
set-executionpolicy bypass
net user Administrator ${random_string.password.result}
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
choco install teamcity -y
</powershell>
EOF

  vpc_security_group_ids = [aws_security_group.teamcity.id]
  tags = var.common_tags
}
