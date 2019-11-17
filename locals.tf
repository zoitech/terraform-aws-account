locals {
  # account alias 
  create_account_alias = (var.create_account_alias == true ? 1 : 0)
  # cloudtrail
  create_cloudtrail        = (var.create_cloudtrail == true ? 1 : 0)
  create_cloudtrail_bucket = (var.create_cloudtrail_bucket == true && var.create_cloudtrail == true ? 1 : 0)
  cloudtrail_bucket_name   = length(var.cloudtrail_bucketname) > 0 ? var.cloudtrail_bucketname : "${data.aws_caller_identity.current.account_id}-logs"

  # guard duty
  create_guardduty_detector = (var.create_guardduty_detector == true ? 1 : 0)

}

