# terraform-aws-account

Terraform module for managing the AWS account.

# Description

This module creates the following resources:

* Set account alias (optional)
* Set IAM password policy (optional)
* CloudTail (optional)
* Create S3 logging bucket for cloudtrail (optional)
* IAM policies (optional)
* Guardduty (optional)
* EC2 key pair (optional)

## Usage

```hcl
module "account" {
  source              = "git::https://github.com/zoitech/terraform-aws-account.git"
  aws_region              = "eu-central-1"
}
```

### Account Alias

Account alias is enabled by default and has the default name "not_set".

```hcl
module "account" {
  source                    = "git::https://github.com/zoitech/terraform-aws-account.git"
  aws_region                    = "eu-central-1"
  create_acount_alias       = true
  account_alias             = "my-aws-account"
}
```

### CloudTrail

Cloudtrail and a cloudtrail bucket will be created by default. To disable, set "create_cloudtrail" and "create_cloudtrail_bucket" to "false".

The cloudtrail bucket will fail to create if "create_cloudtrail_bucket" is set to "true" and "create_cloudtrail" is set to "false".

The "cloudtrail_bucketname" can be the name of an existing bucket (set "create_cloudtrail_bucket" to "false") or it will be used to name the bucket that will be created.

```hcl
module "account" {
  source                   = "git::https://github.com/zoitech/terraform-aws-account.git"
  aws_region                   = "eu-central-1"
  create_cloudtrail        = true
  cloudtrail_name          = "my-cloudtrail"
  create_cloudtrail_bucket = true
  cloudtrail_bucketname    = "my-cloudtrail-bucket"
}
```

### Guardduty Detector

Guardduty detector will be created and enabled by default.

```hcl
module "account" {
  source                    = "git::https://github.com/zoitech/terraform-aws-account.git"
  aws_region                    = "eu-central-1"
  create_guardduty_detector = true
  enable_guardduty_detector = true
}
```

### EC2 Key Pair

Creating a key pair is disabled by default.

```hcl
module "account" {
  source          = "git::https://github.com/zoitech/terraform-aws-account.git"
  aws_region          = "eu-central-1"
  create_key_pair = true
  key_name        = "my-key"
  public_key      = file("my-key-name.pub")
}
```

### AWS KMS Keys

Creating KMS keys is disabled by default.

```hcl
module "account" {
  source          = "git::https://github.com/zoitech/terraform-aws-account.git"
  aws_region          = "eu-central-1"
  create_kms_keys = true
  kms_keys        = [
    {
      alias_name              = "alias/ec2"
      description             = "Encryption/decryption of ec2 data"
      deletion_window_in_days = 30
      is_enabled              = true
      enable_key_rotation     = true
    },
  ]
}
```

### To Reference A Tagged Version of the Repository

To reference a tagged version of the repository:

```hcl
module "network" {
  source        = "git::https://github.com/zoitech/terraform-aws-account.git?ref=2.0.0"
  aws_region        = "eu-central-1"
}
```

## Authors
Module managed by [Zoi](https://github.com/zoitech).

## License
MIT License. See LICENSE for full details.
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudtrail.global_Default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail) | resource |
| [aws_guardduty_detector.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_detector) | resource |
| [aws_iam_account_alias.alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_alias) | resource |
| [aws_iam_account_password_policy.strict](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_password_policy) | resource |
| [aws_iam_policy.deny_expensive_RDS_instances](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.deny_expensive_RI_instances](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.deny_expensive_ec2_instances](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.disable_marketplace](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_key_pair.key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_kms_alias.key_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.cloudtrail_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.cloudtrail_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_alias"></a> [account\_alias](#input\_account\_alias) | The alias for the account, which can be used instead of the account ID when logging in. | `string` | `"not_set"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to deploy into (e.g. us-east-1). | `string` | `"eu-central-1"` | no |
| <a name="input_cloudtrail_bucketname"></a> [cloudtrail\_bucketname](#input\_cloudtrail\_bucketname) | Name of the cloudtrail bucket. Will defaults to <account-id>-logs. | `string` | `""` | no |
| <a name="input_cloudtrail_name"></a> [cloudtrail\_name](#input\_cloudtrail\_name) | Name of the cloudtrail trail. | `string` | `"Default"` | no |
| <a name="input_create_account_alias"></a> [create\_account\_alias](#input\_create\_account\_alias) | Defines if an account alias should be created. | `bool` | `true` | no |
| <a name="input_create_account_password_policy"></a> [create\_account\_password\_policy](#input\_create\_account\_password\_policy) | Defines if an account password policy should be created | `bool` | `true` | no |
| <a name="input_create_cloudtrail"></a> [create\_cloudtrail](#input\_create\_cloudtrail) | Defines if cloud trail should be created | `bool` | `true` | no |
| <a name="input_create_cloudtrail_bucket"></a> [create\_cloudtrail\_bucket](#input\_create\_cloudtrail\_bucket) | Defines if the bucket should be created. | `bool` | `true` | no |
| <a name="input_create_ec2_limit_policy"></a> [create\_ec2\_limit\_policy](#input\_create\_ec2\_limit\_policy) | Activate (1) or deactivate (0) this policy | `string` | `"0"` | no |
| <a name="input_create_ec2_limit_policy_name"></a> [create\_ec2\_limit\_policy\_name](#input\_create\_ec2\_limit\_policy\_name) | Name of the IAM\_Policy for EC2 Limit | `string` | `"AmazonEC2LimitInstanceCreation"` | no |
| <a name="input_create_ec2_limit_policy_type"></a> [create\_ec2\_limit\_policy\_type](#input\_create\_ec2\_limit\_policy\_type) | Type of EC2 Instances, for example, xlarge; wildcards can be used | `string` | `"*xlarge"` | no |
| <a name="input_create_guardduty_detector"></a> [create\_guardduty\_detector](#input\_create\_guardduty\_detector) | Defines if guardduty detectory should be created. | `bool` | `false` | no |
| <a name="input_create_key_pair"></a> [create\_key\_pair](#input\_create\_key\_pair) | Defines if key pair should be created. | `bool` | `false` | no |
| <a name="input_create_kms_keys"></a> [create\_kms\_keys](#input\_create\_kms\_keys) | Defines if kms key(s) should be created. | `bool` | `false` | no |
| <a name="input_create_marketplace_disable_policy"></a> [create\_marketplace\_disable\_policy](#input\_create\_marketplace\_disable\_policy) | Activate (1) or deactivate (0) this policy | `string` | `"0"` | no |
| <a name="input_create_marketplace_disable_policy_name"></a> [create\_marketplace\_disable\_policy\_name](#input\_create\_marketplace\_disable\_policy\_name) | Disables Access to marketplace software | `string` | `"deny_marketplace"` | no |
| <a name="input_create_rds_limit_policy"></a> [create\_rds\_limit\_policy](#input\_create\_rds\_limit\_policy) | Activate (1) or deactivate (0) this policy | `string` | `"0"` | no |
| <a name="input_create_rds_limit_policy_name"></a> [create\_rds\_limit\_policy\_name](#input\_create\_rds\_limit\_policy\_name) | Name of the IAM\_Policy for RDS Limit | `string` | `"AmazonRDSLimitInstanceCreation"` | no |
| <a name="input_create_rds_limit_policy_type"></a> [create\_rds\_limit\_policy\_type](#input\_create\_rds\_limit\_policy\_type) | Type of RDS Instances, for example, xlarge; wildcards can be used | `string` | `"*xlarge"` | no |
| <a name="input_create_reserved_instances_limit_policy"></a> [create\_reserved\_instances\_limit\_policy](#input\_create\_reserved\_instances\_limit\_policy) | Activate (1) or deactivate (0) this policy | `string` | `"0"` | no |
| <a name="input_create_reserved_instances_limit_policy_name"></a> [create\_reserved\_instances\_limit\_policy\_name](#input\_create\_reserved\_instances\_limit\_policy\_name) | Name of the IAM\_Policy for Reserved Instances Limit | `string` | `"AmazonRILimitInstanceCreation"` | no |
| <a name="input_enable_guardduty_detector"></a> [enable\_guardduty\_detector](#input\_enable\_guardduty\_detector) | Enable/disable guardduty detector | `bool` | `true` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | The name of the public key | `string` | `"default_key"` | no |
| <a name="input_kms_keys"></a> [kms\_keys](#input\_kms\_keys) | List of kms key objects | <pre>list(object({<br>    alias_name              = string<br>    description             = string<br>    deletion_window_in_days = number<br>    is_enabled              = bool<br>    enable_key_rotation     = bool<br>    #policy =<br>    #tags = <br>  }))</pre> | `null` | no |
| <a name="input_password_hard_expiry"></a> [password\_hard\_expiry](#input\_password\_hard\_expiry) | Requires administrative reset of the user after expiring. | `bool` | `false` | no |
| <a name="input_password_max_age"></a> [password\_max\_age](#input\_password\_max\_age) | The maximum age before a password will expire. | `number` | `0` | no |
| <a name="input_password_min_length"></a> [password\_min\_length](#input\_password\_min\_length) | The minimal length of passwords. | `number` | `10` | no |
| <a name="input_password_reuse_prevention"></a> [password\_reuse\_prevention](#input\_password\_reuse\_prevention) | Prevent reuse of the given amount of passwords. | `number` | `10` | no |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | The public key value | `any` | `null` | no |
| <a name="input_tag_name"></a> [tag\_name](#input\_tag\_name) | Name of the 'name' tag that is added to, for example, the S3 resources | `string` | `"Name"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_trail_bucket_default_encryption"></a> [trail\_bucket\_default\_encryption](#input\_trail\_bucket\_default\_encryption) | Defines if the Bucket is encrypted, defaults to AES256 | `string` | `"AES256"` | no |
| <a name="input_trail_bucket_default_encryption_key"></a> [trail\_bucket\_default\_encryption\_key](#input\_trail\_bucket\_default\_encryption\_key) | Defines if the KMS encryption key, used if trail\_bucket\_default\_encryption is set to aws:kms | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket"></a> [bucket](#output\_bucket) | The name of the bucket where logs are send to. |
