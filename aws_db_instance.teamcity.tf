resource "aws_db_instance" "teamcity" {
  # checkov:skip=CKV_AWS_157: multi region not required
  count                           = var.need_db
  backup_retention_period         = var.backup_retention_period
  allocated_storage               = var.allocated_storage
  db_subnet_group_name            = aws_db_subnet_group.teamcity.0.name
  engine                          = "mysql"
  engine_version                  = var.engine_version
  instance_class                  = var.instance_class
  monitoring_interval             = var.monitoring_interval
  monitoring_role_arn             = var.monitoring_role_arn
  db_name                         = "teamcity"
  password                        = random_string.dbpassword.result
  storage_encrypted               = true
  username                        = "teamcity"
  enabled_cloudwatch_logs_exports = ["general", "error", "slowquery"]
  vpc_security_group_ids          = [aws_security_group.rds.0.id]

  tags = var.common_tags
}

variable "backup_retention_period" {
  type    = number
  default = 14
}

variable "engine_version" {
  type        = string
  default     = "5.7.11"
  description = "MySQl Version"
}


variable "instance_class" {
  type        = string
  default     = "db.t2.small"
  description = "Instance DB size"
}

variable "monitoring_interval" {
  type        = string
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance"
  default     = 30

  validation {
    condition     = can(regex("0|1|5|10|15|30|60", var.monitoring_interval))
    error_message = "Valid Values: 0, 1, 5, 10, 15, 30, 60."
  }
}

variable "monitoring_role_arn" {
  type    = string
  default = ""
}

variable "allocated_storage" {
  type    = number
  default = 10
}
