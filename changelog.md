## 1.0.0

BACKWARDS INCOMPATIBILITIES / NOTES:

* Works with terraform 0.12.x ([#15](https://github.com/zoitech/terraform-aws-account/issues/15))
* Variable "trail_bucketname_create" renamed to "create_cloudtrail_bucket" ([#16](https://github.com/zoitech/terraform-aws-account/issues/16))

BUG FIXES:

* Fix provider constraint ([#12](https://github.com/zoitech/terraform-aws-account/issues/12))

IMPROVEMENTS:

* Added count to make cloudtrail optional ([#16](https://github.com/zoitech/terraform-aws-account/issues/16))

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
