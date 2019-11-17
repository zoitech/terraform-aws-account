# region
variable "aws_region" {
  description = "The AWS region to deploy into (e.g. us-east-1)."
  default     = "eu-central-1"
}
# account alias
variable "create_account_alias" {
  description = "Defines if an account alias should be created."
  default     = true
}

variable "account_alias" {
  description = "The alias for the account, which can be used instead of the account ID when logging in."
  default     = "not_set"
}

# account password policy
variable "create_account_password_policy" {
  description = "Defines if an account password policy should be created"
  default     = true
}

# password policy
variable "password_min_length" {
  description = "The minimal length of passwords."
  default     = 10
}

variable "password_reuse_prevention" {
  description = "Prevent reuse of the given amount of passwords."
  default     = 10
}

variable "password_hard_expiry" {
  description = "Requires administrative reset of the user after expiring."
  default     = false
}

variable "password_max_age" {
  description = "The maximum age before a password will expire."
  default     = 0
}

# cloud trail
variable "create_cloudtrail" {
  description = "Defines if cloud trail should be created"
  default     = true
}

variable "create_cloudtrail_bucket" {
  description = "Defines if the bucket should be created."
  default     = true
}

variable "cloudtrail_name" {
  description = "Name of the cloudtrail trail."
  default     = "Default"
}

variable "cloudtrail_bucketname" {
  description = "Name of the cloudtrail bucket. Will defaults to <account-id>-logs."
  default     = ""
}

variable "trail_bucket_default_encryption" {
  description = "Defines if the Bucket is encrypted, defaults to AES256"
  default     = "AES256"
}

variable "trail_bucket_default_encryption_key" {
  description = "Defines if the KMS encryption key, used if trail_bucket_default_encryption is set to aws:kms"
  default     = ""
}

# tags
variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
  type        = map(string)
}

variable "name_tag_name" {
  description = "Name of the 'name' tag that is added to, for example, the S3 resources"
  default     = "Name"
}

# iam policies
variable "create_ec2_limit_policy_name" {
  description = "Name of the IAM_Policy for EC2 Limit"
  default     = "AmazonEC2LimitInstanceCreation"
}

variable "create_ec2_limit_policy" {
  description = "Activate (1) or deactivate (0) this policy"
  default     = "0"
}

variable "create_ec2_limit_policy_type" {
  description = "Type of EC2 Instances, for example, xlarge; wildcards can be used"
  default     = "*xlarge"
}

variable "create_rds_limit_policy_name" {
  description = "Name of the IAM_Policy for RDS Limit"
  default     = "AmazonRDSLimitInstanceCreation"
}

variable "create_rds_limit_policy" {
  description = "Activate (1) or deactivate (0) this policy"
  default     = "0"
}

variable "create_rds_limit_policy_type" {
  description = "Type of RDS Instances, for example, xlarge; wildcards can be used"
  default     = "*xlarge"
}

variable "create_reserved_instances_limit_policy_name" {
  description = "Name of the IAM_Policy for Reserved Instances Limit"
  default     = "AmazonRILimitInstanceCreation"
}

variable "create_reserved_instances_limit_policy" {
  description = "Activate (1) or deactivate (0) this policy"
  default     = "0"
}

variable "create_marketplace_disable_policy_name" {
  description = "Disables Access to marketplace software"
  default     = "deny_marketplace"
}

variable "create_marketplace_disable_policy" {
  description = "Activate (1) or deactivate (0) this policy"
  default     = "0"
}

# guardduty detector
variable "create_guardduty_detector" {
  description = "Defines if guardduty detectory should be created."
  default     = false
}

variable "enable_guardduty_detector" {
  description = "Enable/disable guardduty detector"
  default     = true
}

