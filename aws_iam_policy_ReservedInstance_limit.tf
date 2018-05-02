resource "aws_iam_policy" "deny_expensive_RI_instances" {
  name        = "${var.reserved_instances_limit_name}"
  count       = "${var.reserved_instances_limit_count}"
  description = "Policy to limit Reserved Instances"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
          {
            "Effect": "Deny",
            "Action": ["${var.reserved_instances_limit_action}"],
            "Resource": "*"
        }
    ]
}
EOF
}
