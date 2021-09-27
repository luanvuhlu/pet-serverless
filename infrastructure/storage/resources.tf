provider "aws" {
  region = var.region
}

resource "random_integer" "rand" {
    min = 10000
    max = 99999
}
resource "aws_s3_bucket" "test_bucket" {
  bucket = local.s3_bucket_name
  acl = "private"
  force_destroy = true
  
  tags = merge(local.common_tags, { Name = local.s3_bucket_name})
}