# CloudTrail
resource "aws_cloudtrail" "global_Default" {
  count                         = local.create_cloudtrail
  name                          = var.cloudtrail_name
  s3_bucket_name                = local.cloudtrail_bucket_name
  is_multi_region_trail         = true
  include_global_service_events = true
  enable_log_file_validation    = true
  tags = merge(
    var.tags,
    {
      var.name_tag_name = format("%s", var.trail_name)
    },
  )
}

