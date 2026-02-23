resource "aws_organizations_organization" "this" {
  feature_set                   = var.feature_set
  aws_service_access_principals = var.aws_service_access_principals
}

# Level 1 OUs - directly under root
resource "aws_organizations_organizational_unit" "level1" {
  for_each  = { for k, v in var.organizational_units : k => v if try(v.parent_key, null) == null }
  name      = each.value.name
  parent_id = aws_organizations_organization.this.roots[0].id
  tags      = try(each.value.tags, {})
}

# Level 2 OUs - nested under level 1
resource "aws_organizations_organizational_unit" "level2" {
  for_each  = { for k, v in var.organizational_units : k => v if try(v.parent_key, null) != null }
  name      = each.value.name
  parent_id = aws_organizations_organizational_unit.level1[each.value.parent_key].id
  tags      = try(each.value.tags, {})
}

module "account" {
  source = "./modules/account"

  for_each = { for k, v in var.account : k => v }

  account_name      = try(each.value.account_name, null)
  account_email     = try(each.value.account_email, null)
  close_on_deletion = try(each.value.close_on_deletion, false)
  role_name         = try(each.value.role_name, "OrganizationAccountAccessRole")
  tags              = try(each.value.tags, null)
  parent_id = try(each.value.parent_id, null) != null ? try(
    aws_organizations_organizational_unit.level1[each.value.parent_id].id,
    aws_organizations_organizational_unit.level2[each.value.parent_id].id
  ) : null
}
