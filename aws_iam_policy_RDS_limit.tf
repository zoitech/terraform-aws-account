resource "aws_iam_policy" "deny_expensive_RDS_instances" {
  name        = "${var.RDS_Limit_Name}"
  count       = "${var.RDS_Limit_Count}"
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
                        "${var.RDS_Limit_Type}"
                    ]
                }
            }
        }
    ]
}
EOF
}
