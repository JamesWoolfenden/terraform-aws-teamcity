provider "aws" {
  region  = "eu-west-2"
  version = "3.2.0"
}

provider "local" {
  version = "1.3"
}

provider "random" {
  version = "2.1"
}

provider "tls" {
  version = "2.0"
}
