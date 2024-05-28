resource "aws_organizations_account" "this" {
  name = var.account_name
  email = var.account_email
  close_on_deletion = var.close_on_deletion
  role_name = var.role_name
  tags = var.tags
}
