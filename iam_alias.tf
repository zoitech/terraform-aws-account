resource "aws_iam_account_alias" "alias" {
  count         = local.create_account_alias
  account_alias = replace(lower(var.account_alias), "_", "-")
}

