variable "instance_type" {
    type=string
}

variable "ssl_cert_arn" {
    type=string
}

variable "vpc_id" {
    type=string
}

variable "key_name" {
    type=string
}

variable "common_tags" {
  type=map
}
