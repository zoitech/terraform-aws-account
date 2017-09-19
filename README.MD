# AWS generic account setup
Terraform module which setup the most generic aws-accounts settings.
* Set account alias
* Set password policy
* Add a logging bucket
* Enable CloudTail


## Usage
```hcl
module "account" {
  source = "zoitech/terraform_aws_account"

  account_name = "my-aws-account"
}
```

## Authors
Module managed by [Malte Brodersen](https://github.com/derbrobro).

## License
MIT License. See LICENSE for full details.
