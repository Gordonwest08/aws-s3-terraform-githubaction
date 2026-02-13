terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " 5.30.0"
    }
  }

  backend "s3" {
    bucket         = "gordonwest-terraform-state"
    key            = "s3-project/production/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

module "s3_bucket" {
  source = "../../modules/s3-bucket"

  bucket_name         = "my-company-prod-assets"
  enable_versioning   = true
  enable_encription   = true
  allow_public_access = false

  tags = {
    Environment = "production"
    Project     = "s3-terraform-ci"
  }
}
