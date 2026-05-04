terraform {
  required_providers {
    local = {
      version = "1.3"
    }

    random = {
      version = "2.1"
    }

    tls = {
      version = "2.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "6.43.0"
    }
  }
  required_version = ">=0.14.8"
}
