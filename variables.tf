
variable "ami_id" {
  type        = string
  description = "Which image to use"
  validation {
    condition     = length(var.ami_id) > 21 && substr(var.ami_id, 0, 4) == "ami-"
    error_message = "The AMI ids need to start with ami- and is 21 characters."
  }
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
  description = "The id for the vpc"
  type        = string
  validation {
    condition     = length(var.vpc_id) > 12 && substr(var.vpc_id, 0, 4) == "vpc-"
    error_message = "The AMI ids need to start with ami- and is at least 12 characters."
  }
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
  validation {
    condition     = contains([0, 1], var.need_db)
    error_message = "This is used as a switch, valid values are only 0 and 1."
  }
}

variable "elb-whitelist" {
  type        = list
  description = "The allow list"
  default     = ["0.0.0.0/0"]
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
  type    = bool
  default = false
}
