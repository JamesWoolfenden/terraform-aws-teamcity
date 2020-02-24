
variable "ami_id" {
  type        = string
  description = "Which image to use"
}

variable "instance_type" {
  type        = string
  description = "THe instance type"
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

variable "listeners" {
  type = list(object({ instance_port = number,
    instance_protocol  = string,
    lb_port            = number,
    lb_protocol        = string,
    ssl_certificate_id = string
  }))
  description = "Details for SSL redirect"
}

variable "associate_public_ip_address" {
  type    = string
  default = false
}
