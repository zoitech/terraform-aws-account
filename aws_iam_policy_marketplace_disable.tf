resource "aws_iam_policy" "disable_marketplace" {
  name        = var.create_marketplace_disable_policy_name
  count       = var.create_marketplace_disable_policy
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

