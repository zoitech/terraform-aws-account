locals {
  # account alias 
  create_account_alias = (var.create_account_alias == true ? 1 : 0)

  # account password policy
  create_account_password_policy = (var.create_account_password_policy == true ? 1 : 0)

  # cloudtrail
  create_cloudtrail        = (var.create_cloudtrail == true ? 1 : 0)
  create_cloudtrail_bucket = (var.create_cloudtrail_bucket == true && var.create_cloudtrail == true ? 1 : 0)
  cloudtrail_bucket_name   = length(var.cloudtrail_bucketname) > 0 ? var.cloudtrail_bucketname : "${data.aws_caller_identity.current.account_id}-logs"

  # guard duty
  create_guardduty_detector = (var.create_guardduty_detector == true ? 1 : 0)

  # ec key pair
  create_key_pair = (var.create_key_pair == true ? 1 : 0)

  # kms keys
  create_kms_keys = (var.create_kms_keys == true && var.kms_keys != null ? length(var.kms_keys) : 0)

}

