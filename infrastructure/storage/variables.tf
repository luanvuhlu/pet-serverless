variable "region" {
  default = "us-east-1"
}

variable "bucket_name_prefix" {
  
}
variable "billing_code_tag" {
  
}

locals {
  env_name = lower(terraform.workspace)

  common_tags = {
      BillingCode = var.billing_code_tag
      Environment = local.env_name
  }

  s3_bucket_name = "${var.bucket_name_prefix}-${local.env_name}-${random_integer.rand.result}"
}