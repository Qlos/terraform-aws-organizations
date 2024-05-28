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
