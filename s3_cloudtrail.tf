resource "aws_s3_bucket" "cloudtrail_bucket" {
  count  = local.create_cloudtrail_bucket
  bucket = local.cloudtrail_bucket_name
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.trail_bucket_default_encryption_key
        sse_algorithm     = var.trail_bucket_default_encryption
      }
    }
  }

  tags = merge(
    var.tags,
    {
      (var.tag_name) = local.cloudtrail_bucket_name
    }
  )

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck20150319",
            "Effect": "Allow",
            "Principal": {"Service": "cloudtrail.amazonaws.com"},
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::${local.cloudtrail_bucket_name}"
        },
        {
            "Sid": "AWSCloudTrailWrite20150319",
            "Effect": "Allow",
            "Principal": {"Service": "cloudtrail.amazonaws.com"},
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${local.cloudtrail_bucket_name}/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
            "Condition": {"StringEquals": {"s3:x-amz-acl": "bucket-owner-full-control"}}
        }
    ]
}
EOF

}

resource "aws_s3_bucket_public_access_block" "cloudtrail_bucket" {
  count                   = local.create_cloudtrail_bucket
  bucket                  = aws_s3_bucket.cloudtrail_bucket[0].id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

