resource "aws_instance" "teamcity" {
  ami           = var.ami_id
  instance_type = var.instance_type
  monitoring    = true
  ebs_optimized = true

  key_name               = aws_key_pair.teamcity.key_name
  subnet_id              = element(var.private_subnets, 0)
  vpc_security_group_ids = [aws_security_group.teamcity.id]
  iam_instance_profile   = aws_iam_instance_profile.teamcity.name

  associate_public_ip_address = var.associate_public_ip_address

  user_data = <<EOF
#! /bin/bash
sudo yum install java-1.8.0-openjdk -y
curl -L https://download.jetbrains.com/teamcity/TeamCity-2019.2.1.tar.gz | tar zx
TeamCity/bin/runAll.sh start
EOF

  root_block_device {
    encrypted = true
  }
  lifecycle {
    ignore_changes = [user_data]
  }

  metadata_options {
    http_tokens = "required"
  }

  tags = var.common_tags
}
