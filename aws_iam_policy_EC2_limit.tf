resource "aws_iam_policy" "deny_expensive_ec2_instances" {
  name        = var.create_ec2_limit_policy_name
  count       = var.create_ec2_limit_policy
  description = "Policy to limit creation of expensive EC2 Instances"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
                {
            "Sid": "DenyLargeEC2",
            "Effect": "Deny",
            "Action": "ec2:RunInstances",
            "Resource": "*",
            "Condition": {
                "StringLike": {
                    "ec2:InstanceType": [
                        "${var.create_ec2_limit_policy_type}"
                    ]
                }
            }
        }
    ]
}
EOF

}

