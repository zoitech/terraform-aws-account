resource "aws_iam_policy" "deny_marketplace" {
  name        = "${var.marketplace_deny_name}"
  count       = "${var.marketplace_deny_count}"
  description = "Policy to deny installing software from the marketplace"

  policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "aws-marketplace:ViewSubscriptions",
          "aws-marketplace:Subscribe",
          "aws-marketplace:Unsubscribe"
        ],
        "Effect": "Deny",
        "Resource": "*"
      }
    ]
  }
EOF
}
