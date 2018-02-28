# CloudTrail
resource "aws_cloudtrail" "global_Default" {
  name                          = "${var.trail_name}"
  s3_bucket_name                = "${aws_s3_bucket.cloudtrail_bucket.id}"
  is_multi_region_trail         = true
  include_global_service_events = true
  enable_log_file_validation    = true
  tags                          = "${merge(var.tags, map(var.name_tag_name, format("%s", var.trail_name)))}"
}
