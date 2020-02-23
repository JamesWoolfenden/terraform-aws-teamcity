output "teamcity" {
  value = aws_instance.teamcity
}

output "elb" {
  value = aws_elb.service_elb
}

output "teamcity_db" {
  value = aws_db_instance.teamcity
}

output "artifact-bucket" {
  value = aws_s3_bucket.artifact
}

output "dbpassword" {
  value = random_string.dbpassword.result
}

output "password" {
  value = random_string.password.result
}
