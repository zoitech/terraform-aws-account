output "bucket" {
  description = "The name of the bucket where logs are send to."
  value       = local.cloudtrail_bucket_name
}

