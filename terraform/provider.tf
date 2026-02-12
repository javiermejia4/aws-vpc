terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.31.0"
    }
  }
}

provider "aws" {
  alias  = "west1"
  region = local.region1
}

provider "aws" {
  alias  = "west2"
  region = local.region2
}