# Configure aws provider
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

# deploy statefile in backend
terraform {
  backend "s3" {
    bucket = "eraki-terrafrom-dev01"
    key    = "devops.tfstate"
  }
}