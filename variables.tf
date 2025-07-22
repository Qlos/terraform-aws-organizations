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
