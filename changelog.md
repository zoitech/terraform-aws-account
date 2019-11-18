## 1.0.0

BACKWARDS INCOMPATIBILITIES / NOTES:

* Works with terraform 0.12.x ([#15](https://github.com/zoitech/terraform-aws-account/issues/15))
* Variable "trail_bucketname_create" renamed to "create_cloudtrail_bucket" ([#16](https://github.com/zoitech/terraform-aws-account/issues/16))
* Variable "guardduty_enable" renamed to "create_guardduty_detector" ([#16](https://github.com/zoitech/terraform-aws-account/issues/16))
* Variable "account_name" renamed to "account_alias"
* Variable "name_tag_name" renamed to "tag_name"

BUG FIXES:

* Fix provider constraint ([#12](https://github.com/zoitech/terraform-aws-account/issues/12))

IMPROVEMENTS:

* Added count to make cloudtrail optional ([#16](https://github.com/zoitech/terraform-aws-account/issues/16))
* Added count to make guardduty detector optional ([#16](https://github.com/zoitech/terraform-aws-account/issues/16))
* Added count to make account alias optional ([#16](https://github.com/zoitech/terraform-aws-account/issues/16))
* Updated README.md ([#9](https://github.com/zoitech/terraform-aws-account/issues/9))

NEW FEATURES:

* Added EC2 key pair resource ([#18](https://github.com/zoitech/terraform-aws-account/issues/18))
* Added AWS KMS key resource ([#19](https://github.com/zoitech/terraform-aws-account/issues/19))

## 0.0.6

NEW FEATURES:

* n.a.

BACKWARDS INCOMPATIBILITIES / NOTES:

* n.a.

IMPROVEMENTS:

* Add Public Access Block for Cloudtrail S3 Bucket

BUG FIXES:

* n.a.

## 0.0.5

NEW FEATURES:

* Support of GuardDuty (set ```guardduty_enable=1```)

BACKWARDS INCOMPATIBILITIES / NOTES:

* n.a.

IMPROVEMENTS:

* formatted tf-files

BUG FIXES:

* Dependency of Bucket and BucketPolicy
* Usage of external Buckets
