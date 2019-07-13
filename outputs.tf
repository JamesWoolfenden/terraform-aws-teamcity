output "public_ip" {
  value = aws_instance.teamcity.public_ip
}

output "private_ip" {
  value = aws_instance.teamcity.private_ip
}

output "loadbalancer" {
  value = aws_elb.service_elb.dns_name
}

output "teamcity_db_endpoint" {
  value = aws_db_instance.teamcity.endpoint
}

output "artifact-bucket" {
  value = aws_s3_bucket.artifact.id
}

output "dbpassword" {
  value = random_string.dbpassword.result
}

output "password" {
  value = random_string.password.result
}
