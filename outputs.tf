output "organizational_units_level1" {
  value       = aws_organizations_organizational_unit.level1
  description = "Level 1 Organizational Units (directly under root)"
}

output "organizational_units_level2" {
  value       = aws_organizations_organizational_unit.level2
  description = "Level 2 Organizational Units (nested under level 1)"
}
