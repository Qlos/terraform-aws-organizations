
# terraform-aws-organizations

This project is **100% Open Source**, build and develop by DevOps Team from [Qlos.com](https://qlos.com)

## About

Terraform module to create [AWS Organizations](https://aws.amazon.com/organizations/). AWS Organizations provides features to managed multiple AWS Accounts

## License

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

```text
The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

Source: <https://opensource.org/licenses/MIT>
```
See [LICENSE](LICENSE) for full details.
## Authors

- Marcin Serek | [github](https://github.com/MarcinS-Qlos)

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

### Modules

| Name | Source | Purpose |
|------|--------|---------|
| account | ./modules/account | Create and manage AWS accounts within the organization |

### Resources

| Name | Type |
|------|------|
| [aws_organizations_organization.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organization) | resource |
| [aws_organizations_organizational_unit.level1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.level2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_feature_set"></a> [feature\_set](#input\_feature\_set) | Set if Organization is created with CONSOLIDATED\_BILLING or ALL features | `string` | `"ALL"` | no |
| <a name="input_account"></a> [account](#input\_account) | Defined accounts to create | `any` | `{}` | no |
| <a name="input_aws_service_access_principals"></a> [aws\_service\_access\_principals](#input\_aws\_service\_access\_principals) | List of AWS service principals to enable integration with AWS Organizations | `list(string)` | `[]` | no |
| <a name="input_organizational_units"></a> [organizational\_units](#input\_organizational\_units) | Map of Organizational Units to create. Each key is a unique identifier, value contains: name, parent\_key (optional, for nesting), tags (optional) | `any` | `{}` | no |

### Outputs

| Name | Description |
|------|-------------|
| organizational\_units\_level1 | Level 1 Organizational Units (directly under root) |
| organizational\_units\_level2 | Level 2 Organizational Units (nested under level 1) |

### Examples

```hcl
module "organization" {
  source = "github.com/Qlos/terraform-aws-organizations"

  feature_set = "ALL"

  aws_service_access_principals = [
    "sso.amazonaws.com",
  ]

  organizational_units = {
    "security" = {
      name = "Security"
    }
    "workloads" = {
      name = "Workloads"
    }
    "workloads-prod" = {
      name       = "prod"
      parent_key = "workloads"
    }
    "workloads-dev" = {
      name       = "dev"
      parent_key = "workloads"
    }
  }

  account = [
    {
      account_name  = "audit"
      account_email = "audit@example.com"
      parent_id     = "security"
    },
    {
      account_name  = "production"
      account_email = "prod@example.com"
      parent_id     = "workloads-prod"
    },
    {
      account_name  = "development"
      account_email = "dev@example.com"
      parent_id     = "workloads-dev"
    },
  ]
}
```
