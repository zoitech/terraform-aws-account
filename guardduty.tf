resource "aws_guardduty_detector" "main" {
  enable = true
  count  = var.guardduty_enable
}

