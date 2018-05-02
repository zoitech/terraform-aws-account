resource "aws_iam_policy" "deny_expensive_RDS_instances" {
  name        = "${var.rds_limit_name}"
  count       = "${var.rds_limit_count}"
  description = "Policy to limit creation of expensive RDS Instances"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "DenyXlargeRDS",
            "Effect": "Deny",
            "Action": "rds:CreateDBInstance",
            "Resource": "*",
            "Condition": {
                "StringLike": {
                    "rds:DatabaseClass": [
                        "${var.rds_limit_type}"
                    ]
                }
            }
        }
    ]
}
EOF
}
