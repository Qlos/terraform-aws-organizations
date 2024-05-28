variable "account_email" {
  type = string
  default = null
  description = "AWS Account email"
}

variable "account_name" {
  type = string
  default = null
  description = "AWS Account name"
}


variable "close_on_deletion" {
  type = bool
  default = false
  description = "Set if account should be deleted on resource destroy. If set to no account will only removed from organization"
}

variable "role_name" {
  type = string
  default = "OrganizationAccountAccessRole"
  description = "Role defined on account creation to access from management account"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the resource."
}
