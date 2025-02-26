data "http" "ptp_azure" {
  url = var.azure_metadata_url

  request_headers = {
    Accept = "application/xml"
  }
}

resource "aws_iam_saml_provider" "ptp" {
  name                   = "ptp-sso"
  saml_metadata_document = data.http.ptp_azure.response_body
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::842675975653:root"]
    }

    condition {
      test     = "ArnLike"
      variable = "aws:PrincipalArn"
      values   = ["arn:aws:sts::842675975653:assumed-role/AWSReservedSSO_cli-secure-access_*"]
    }
  }

  statement {
    actions = ["sts:AssumeRoleWithSAML"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_saml_provider.ptp.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "SAML:aud"
      values   = ["https://signin.aws.amazon.com/saml"]
    }
  }
}

resource "aws_iam_role" "ptp_admin" {
  name               = "PTP-AdminRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "ptp_admin" {
  role       = aws_iam_role.ptp_admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_role" "ptp_pu" {
  name               = "PTP-PowerUserRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "ptp_pu" {
  role       = aws_iam_role.ptp_pu.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

resource "aws_iam_role" "ptp_iam" {
  name               = "PTP-IAMAdminRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "ptp_iam" {
  role       = aws_iam_role.ptp_iam.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

resource "aws_iam_role" "ptp_ro" {
  name               = "PTP-ReadOnlyRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "ptp_ro" {
  role       = aws_iam_role.ptp_ro.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_user" "ptp_role_manager" {
  name = "ptp-sso-role-manager"
  tags = {
    Description = "Allows listing roles for PTP SSO."
  }
}

resource "aws_iam_user_policy" "ptp_role_manager" {
  name = "ptp-sso-role-manager"
  user = aws_iam_user.ptp_role_manager.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "iam:ListRoles"
        ]
        Effect = "Allow"
        Resource = [
          "*"
        ]
      }
    ]
  })
}

resource "aws_iam_access_key" "ptp_role_manager" {
  user = aws_iam_user.ptp_role_manager.name
}
