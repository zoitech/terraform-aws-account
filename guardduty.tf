resource "aws_guardduty_detector" "main" {
  count  = local.create_guardduty_detector
  enable = var.enable_guardduty_detector
}

