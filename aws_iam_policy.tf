resource "aws_iam_policy" "policy" {
	name = "prevent_cost"
	path = "/"
	description = "Policy to limit EC2, RDS and RI"

	policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "DenyLargeCreate",
            "Effect": "Deny",
            "Action": "rds:CreateDBInstance",
            "Resource": "*",
            "Condition": {
                "StringLike": {
                    "rds:DatabaseClass": [
                        "*xlarge"
                    ]
                }
            }
        },
        {
            "Sid": "VisualEditor0",
            "Effect": "Deny",
            "Action": "ec2:RunInstances",
            "Resource": "*",
            "Condition": {
                "StringLike": {
                    "ec2:InstanceType": [
                        "*xlarge"
                    ]
                }
            }
        },
        {
            "Effect": "Deny",
            "Action": [
                "ec2:ModifyReservedInstances",
                "ec2:PurchaseReservedInstancesOffering",
                "ec2:DescribeReservedInstancesOfferings"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}
