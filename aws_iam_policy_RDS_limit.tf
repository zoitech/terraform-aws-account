resource "aws_iam_policy" "deny_expensive_RDS_instances" {
  name        = var.create_rds_limit_policy_name
  count       = var.create_rds_limit_policy
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
                        "${var.create_rds_limit_policy_type}"
                    ]
                }
            }
        }
    ]
}
EOF

}

