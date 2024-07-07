# Configure aws provider
provider "aws" {
  region  = "us-east-1"
  profile = "defult"
}

# deploy statefile in backend
terraform {
  backend "s3" {
    bucket = "test-terrafrom-dev01"
  }
}