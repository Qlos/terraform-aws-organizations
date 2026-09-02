variable "feature_set" {
  type        = string
  default     = "ALL"
  description = "Set if Organization is created with CONSOLIDATED_BILLING or ALL features"
}

variable "account" {
  type        = any
  default     = {}
  description = "Defined accounts to create"
}

variable "aws_service_access_principals" {
  type        = list(string)
  default     = []
  description = "List of AWS service principals to enable integration with AWS Organizations"
}

variable "organizational_units" {
  type        = any
  default     = {}
  description = "Map of Organizational Units to create. Each key is a unique identifier, value contains: name, parent_key (optional, for nesting), tags (optional)"
}

variable "enabled_policy_types" {
  type        = list(string)
  default     = []
  description = "List of Organizations policy types to enable in the Organization Root. Valid values: SERVICE_CONTROL_POLICY, TAG_POLICY, BACKUP_POLICY, AISERVICES_OPT_OUT_POLICY"
}
