output "s3_bucket_name" {
  description = "The name of the created S3 bucket."
  value       = module.s3_bucket.bucket_name
}