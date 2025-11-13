module "ptp_sso" {
  source = "s3::https://module-releases-600468852607.s3.us-east-1.amazonaws.com/modules/ptp-sso/latest/source.tar.gz"

  account_name = var.account_name
}
