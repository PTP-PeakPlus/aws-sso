resource "aws_secretsmanager_secret" "key" {
  name                    = "/iam/user/${aws_iam_user.ptp_role_manager.name}"
  description             = "Access keys for ${aws_iam_user.ptp_role_manager.name}."
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "key" {
  secret_id     = aws_secretsmanager_secret.key.id
  secret_string = <<EOF
  {
    "access_key": "${aws_iam_access_key.ptp_role_manager.id}",
    "secret_key": "${aws_iam_access_key.ptp_role_manager.secret}"
  }
	EOF
}
