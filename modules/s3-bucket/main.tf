terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " 5.30.0"
    }
  }
}


resource "aws_s3_bucket" "gordonwest_bucket" {
  bucket = var.bucket_name
  tags = var.tags
  
}
 
#Enable Versioning

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.gordonwest_bucket.id

  versioning_configuration {
    status = var.enable_versioning? "Enabled" : "Suspended" 
  }
  
}

#Enable Server-Side Encryption (SSE-S3)
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  count = var.enable_encription? 1 : 0
  bucket = aws_s3_bucket.gordonwest_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
  
}

#Enforce Private Access by Default

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.gordonwest_bucket.id

  block_public_acls = var.allow_public_access ? false : true
  block_public_policy = var.allow_public_access ? false : true
  ignore_public_acls = var.allow_public_access ? false : true
  restrict_public_buckets = var.allow_public_access ? false : true
  
}