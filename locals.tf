locals {
  bucket_name = length(var.trail_bucketname) > 0 ? var.trail_bucketname : "${data.aws_caller_identity.current.account_id}-logs"
}

