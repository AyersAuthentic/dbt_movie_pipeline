data "aws_caller_identity" "current" {}

provider "aws" {
  region                   = var.aws_region
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "terraform-nyc-taxi"

  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "terraform"
    }
  }
}

terraform {
  # No backend block = local state
}

module "s3_bucket" {
  source      = "./modules/s3"
  bucket_name = "movieflix-data-bucket-${data.aws_caller_identity.current.account_id}"
}
