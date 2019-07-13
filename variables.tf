
variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ssl_cert_arn" {
  type = string
}

variable "key_name" {
  description = "description"
}

variable "vpc_id" {
  type = string
}

variable "common_tags" {
  type        = map
  description = "Implements the common_tags scheme"
}
