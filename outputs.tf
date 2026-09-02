output "organizational_units_level1" {
  value       = aws_organizations_organizational_unit.level1
  description = "Level 1 Organizational Units (directly under root)"
}

output "organizational_units_level2" {
  value       = aws_organizations_organizational_unit.level2
  description = "Level 2 Organizational Units (nested under level 1)"
}

output "accounts" {
  value       = module.account
  description = "Created AWS accounts, keyed the same as var.account"
}

output "account_ids" {
  value       = { for k, v in module.account : k => v.id }
  description = "Map of account key to AWS Account ID"
}
