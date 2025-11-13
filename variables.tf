variable "session_duration" {
  description = "SAML session duration in seconds"
  type        = string
  default     = "43200" # 12 hours
}

variable "account_name" {
  description = "The name of the AWS account."
  type        = string
  default     = ""
}
