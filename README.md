# PTP AWS SSO

This repository contains the Terraform code to provision AWS SSO with the PTP Azure SSO connector. After deployment the resulting Entra Enterprise Application will need to be placed into an App Collection if required.

```
sudo yum install -y yum-utils; sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo; sudo yum install -y terraform; git clone https://github.com/PTP-PeakPlus/aws-sso.git; cd aws-sso; terraform init; terraform apply -auto-approve -var="account_name=xxxx"
```
