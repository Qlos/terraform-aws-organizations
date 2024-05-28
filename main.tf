resource "aws_organizations_organization" "this" {
  feature_set = var.feature_set
}

module "account" {
  source = "./modules/account"

for_each = {for k, v in var.account : k=> v}

  account_name      = try(each.value.account_name, null)
  account_email     = try(each.value.account_email, null)
  close_on_deletion = try(each.value.close_on_deletion, false)
  role_name         = try(each.value.role_name, "OrganizationAccountAccessRole")
  tags              = try(each.value.tags, null)
}
