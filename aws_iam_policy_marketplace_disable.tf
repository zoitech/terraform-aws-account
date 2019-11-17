resource "aws_iam_policy" "disable_marketplace" {
  count       = var.create_marketplace_disable_policy
  name        = var.create_marketplace_disable_policy_name
  description = "Policy to deny installing software from the marketplace"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
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

