resource "aws_iam_policy" "deny_expensive_RI_instances" {
  name        = "${var.Reserved_Instances_Limit_Name}"
  count       = "${var.Reserved_Instances_Limit_Count}"
  description = "Policy to limit Reserved Instances"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
          {
            "Effect": "Deny",
            "Action": ["${var.Reserved_Instances_Limit_Action}"],
            "Resource": "*"
        }
    ]
}
EOF
}
