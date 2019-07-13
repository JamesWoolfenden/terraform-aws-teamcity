provider "aws" {
  region  = "eu-west-1"
  version = "2.19"
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
