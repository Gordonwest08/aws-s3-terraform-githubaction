output "bucket_name" {
    description = "the name of the bucket"
    value = aws_s3_bucket.gordonwest_bucket
  
}

output "bucket_arn" {
    description = "arn of the bucket"
    value = aws_s3_bucket.gordonwest_bucket.arn
  
}