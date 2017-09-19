# AWS generic account setup
================================================

Terraform module sets up the generic accounts settings.
It helps you configuring the general generic account settings:
* Set account alias
* Set password policy
* Add a logging bucket
* Enable CloudTail


Usage
-----

```hcl
module "account" {
  source = "zoitech/terraform_aws_account"

  account_name = "my-aws-account"

}
```

Authors
-------

Module managed by [Malte Brodersen](https://github.com/derbrobro).

License
-------

MIT License. See LICENSE for full details.
