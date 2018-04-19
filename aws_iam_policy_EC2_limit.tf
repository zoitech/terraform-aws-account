resource "aws_iam_policy" "deny_expensive_EC2_instances" {
  name        = "${var.EC2_Limit_Name}"
  count       = "${var.EC2_Limit_Count}"
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
                        "${var.EC2_Limit_Type}"
                    ]
                }
            }
        }
    ]
}
EOF
}
