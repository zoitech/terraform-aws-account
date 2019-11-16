# IAM Settings
resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = var.password_min_length
  require_uppercase_characters   = true
  require_lowercase_characters   = true
  require_numbers                = true
  require_symbols                = true
  allow_users_to_change_password = true
  password_reuse_prevention      = var.password_reuse_prevention
  hard_expiry                    = var.password_hard_expiry
  max_password_age               = var.password_max_age
}

