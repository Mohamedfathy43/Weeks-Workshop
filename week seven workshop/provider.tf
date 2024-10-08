# Configure aws provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

# deploy statefile in backend
terraform {
  backend "s3" {
    bucket = "terrafrom-Week-seven-dev01"
    key    = "devops.tfstate"
  }
}