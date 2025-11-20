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

variable "notification_identifier" {
  description = "This is the identifier that will be included with the aws-accounts@ptp.cloud email notification."
  type        = string
  default     = ""
}
