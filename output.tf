output "aws_iam_access_key" {
  value = aws_iam_access_key.ptp_role_manager.id
}

output "aws_iam_access_secret" {
  value     = aws_iam_access_key.ptp_role_manager.secret
  sensitive = true
}
