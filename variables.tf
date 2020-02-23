
variable "ami_id" {
  type        = string
  description = ""
}

variable "instance_type" {
  type        = string
  description = ""
}

variable "ssl_cert_arn" {
  type    = string
  default = ""
}


variable "key_name" {
  type        = string
  description = "description"
}

variable "vpc_id" {
  description = ""
  type        = string
}

variable "common_tags" {
  type        = map
  description = "Implements the common_tags scheme"
}


variable "whitelist" {
  description = "The CIDRs that can have access to the instance"
  type        = list
  default     = ["0.0.0.0/0"]
}

variable "private_subnets" {
  type = list
}

variable "public_subnets" {
  type = list
}

variable "need_db" {
  description = "Only create db when set"
  default     = 0
}

variable "elb-whitelist" {
  default = ["0.0.0.0/0"]
}
