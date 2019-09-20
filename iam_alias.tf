resource "aws_iam_account_alias" "alias" {
  account_alias = replace(lower(var.account_name), "_", "-")
}

