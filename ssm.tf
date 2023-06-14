resource "aws_ssm_parameter" "ptp_role_manager_access_key" {
  name  = "ptp_role_manager_access_key"
  type  = "String"
  value = aws_iam_access_key.ptp_role_manager.id
}

resource "aws_ssm_parameter" "ptp_role_manager_secret_key" {
  name  = "ptp_role_manager_secret_key"
  type  = "SecureString"
  value = aws_iam_access_key.ptp_role_manager.secret
}
