
# terraform-aws-client-vpn

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

No modules.

### Resources

| Name | Type |
|------|------|
| [aws_organizations_account.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_account) | resource |
| [aws_organizations_organization.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organization) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_email"></a> [account\_email](#input\_account\_email) | AWS Account email | `string` | `null` | no |
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | AWS Account name | `string` | `null` | no |
| <a name="input_close_on_deletion"></a> [close\_on\_deletion](#input\_close\_on\_deletion) | Set if account should be deleted on resource destroy. If set to no account will only removed from organization | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Client VPN description | `string` | `null` | no |
| <a name="input_feature_set"></a> [feature\_set](#input\_feature\_set) | Set if Organization is created with CONSOLIDATED\_BILLING or ALL features | `string` | `"ALL"` | no |
| <a name="input_name"></a> [name](#input\_name) | Client VPN name | `string` | `null` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Role defined on account creation to access from management account | `string` | `"OrganizationAccountAccessRole"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |

### Outputs

No outputs.

### Examples


