# AWS generic account setup
Terraform module which setup the most generic aws-accounts settings.
* Set account alias
* Set password policy
* Add a logging bucket
* Enable CloudTail


## Usage
```hcl
module "account" {
  source = "zoitech/account/aws"
  account_name = "my-aws-account"
}
```

## Authors
Module managed by [Zoi](https://github.com/zoitech).

## License
MIT License. See LICENSE for full details.
