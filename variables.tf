data "aws_caller_identity" "current" {}

variable "aws_region" {
  description = "The AWS region to deploy into (e.g. us-east-1)."
  default     = "eu-central-1"
}

variable "account_name" {
  description = "The name of the account."
  default     = "not_set"
}

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

variable "trail_name" {
  description = "Name of the cloudtrail trail."
  default     = "Default"
}

variable "trail_bucketname" {
  description = "Name of the cloudtrail bucket. Will defaults to <account-id>-logs."
  default     = ""
}

variable "trail_bucketname_create" {
  description = "Defines if the bucket should be created."
  default     = 1
}

variable "trail_bucket_default_encryption" {
  description = "Defines if the Bucket is encrypted, defaults to AES256"
  default     = "AES256"
}

variable "trail_bucket_default_encryption_key" {
  description = "Defines if the KMS encryption key, used if trail_bucket_default_encryption is set to aws:kms"
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
  type        = "map"
}

variable "name_tag_name" {
  description = "Name of the 'name' tag that is added to, for example, the S3 resources"
  default     = "Name"
}

variable "EC2_Limit_Name" {
  description = "Name of the IAM_Policy for EC2 Limit"
  default     = "AmazonEC2LimitInstanceCreation"
}

variable "EC2_Limit_Count" {
  description = "Activate (1) or deactivate (0) this policy"
  default     = "1"
}

variable "EC2_Limit_Type" {
  description = "Type of EC2 Instances, for example, xlarge; wildcards can be used"
  default     = "*xlarge"
}

variable "RDS_Limit_Name" {
  description = "Name of the IAM_Policy for RDS Limit"
  default     = "AmazonRDSLimitInstanceCreation"
}

variable "RDS_Limit_Count" {
  description = "Activate (1) or deactivate (0) this policy"
  default     = "1"
}

variable "RDS_Limit_Type" {
  description = "Type of RDS Instances, for example, xlarge; wildcards can be used"
  default     = "*xlarge"
}

variable "Reserved_Instances_Limit_Name" {
  description = "Name of the IAM_Policy for Reserved Instances Limit"
  default     = "AmazonRILimitInstanceCreation"
}

variable "Reserved_Instances_Limit_Count" {
  description = "Activate (1) or deactivate (0) this policy"
  default     = "1"
}

variable "Reserved_Instances_Limit_Action" {
  description = "Restrict Action for example {ec2:ModifyReservedInstances, ec2:PurchaseReservedInstancesOffering, ec2:DescribeReservedInstancesOfferings}"
  default     = "EC2:PurchaseReservedInstancesOffering"
}
