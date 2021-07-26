terraform {
  required_providers {
    aws = {
      version = "3.51.0"
      source  = "hashicorp/aws"
    }
    local = {
      version = "1.3"
    }

    random = {
      version = "2.1"
    }

    tls = {
      version = "2.0"
    }
  }
  required_version = ">=0.14.8"
}
