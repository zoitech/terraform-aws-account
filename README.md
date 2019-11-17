# terraform-aws-account

Terraform module for managing the AWS account.

# Description

This module creates the following resources:

* Set account alias
* Set password policy
* Add a logging bucket
* Enable CloudTail
* Create IAM_Policy

## Usage

```hcl
module "account" {
  source       = "git::https://github.com/zoitech/terraform-aws-account.git"
  region       = "eu-central-1"
  account_name = "my-aws-account"
}
```

### Account Alias

Account alias is enabled by default and has the default name "not_set".

```hcl
module "account" {
  source                    = "git::https://github.com/zoitech/terraform-aws-account.git"
  region                    = "eu-central-1"
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
  region                   = "eu-central-1"
  account_alias            = "my-aws-account"
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
  region                    = "eu-central-1"
  account_alias             = "my-aws-account"
  create_guardduty_detector = true
  enable_guardduty_detector = true
}
```

### To Reference A Tagged Version of the Repository

To reference a tagged version of the repository:

```hcl
module "network" {
  source        = "git::https://github.com/zoitech/terraform-aws-account.git?ref=v0.0.5"
  region        = "eu-central-1"
  account_alias = "my-aws-account"
}
```

## Authors
Module managed by [Zoi](https://github.com/zoitech).

## License
MIT License. See LICENSE for full details.
