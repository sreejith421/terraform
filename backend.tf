provider "aws" {
  region = "ap-south-1"
  profile = "6923i221111"
}

terraform {
  backend "s3" {
    encrypt = "true"
    bucket = "terraform-remote-states"
    dynamodb_table = "tf-state-lock"
    key = "lockfile1"
    region = "ap-south-1"
    profile = "6923i221111"
  }
}
