variable "bucket_name" {
  description = "name of the bucket"
  type = string
}


variable "enable_versioning" {
    description = "Enable s3 Versioning bucket"
    type = bool
    default = true
  
}

variable "enable_encription" {
    description = "Enable server-side encryption"
    type = bool
    default = true
  
}

variable "allow_public_access" {
    description = "Allow public s3 access"
    type = bool
    default = false 
  
}

variable "tags" {
  
  description = "tags to apply to the bucket"
  type = map(string)
  default = {}
}