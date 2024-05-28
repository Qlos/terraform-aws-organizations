resource "aws_organizations_organization" "this" {
  feature_set = var.feature_set
}

module "account" {
  source = "./modules/account"

for_each = {for k, v in var.account : k=> v}

  account_name      = each.value.account_name
  account_email     = each.value.account_email
  close_on_deletion = each.value.close_on_deletion
  role_name         = each.value.role_name
  tags              = each.value.tags
}
