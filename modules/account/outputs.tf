output "id" {
  value       = aws_organizations_account.this.id
  description = "AWS Account ID"
}

output "arn" {
  value       = aws_organizations_account.this.arn
  description = "ARN of the AWS Account"
}

output "name" {
  value       = aws_organizations_account.this.name
  description = "AWS Account name"
}

output "email" {
  value       = aws_organizations_account.this.email
  description = "Email address of the AWS Account root user"
}

output "state" {
  value       = aws_organizations_account.this.state
  description = "State of the AWS Account in the organization (ACTIVE, SUSPENDED, PENDING_CLOSURE)"
}
