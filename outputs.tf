output "bucket" {
  value = "${aws_s3_bucket.cloudtrail_bucket.bucket}"
}
