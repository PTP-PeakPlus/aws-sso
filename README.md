# PTP AWS SSO

This repository contains the Terraform code to provision AWS SSO with the PTP Azure SSO connector.

*** The AWS Organization ID will need to be adding to the Module Release configuration before attempting to deploy. ***

 After deployment the resulting Entra Enterprise Application will need to be placed into an App Collection if required.

```
sudo yum install -y yum-utils; sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo; sudo yum install -y terraform; cd /tmp; git clone https://github.com/PTP-PeakPlus/aws-sso.git; cd aws-sso; terraform init; terraform apply -auto-approve -var="account_name=xxxx" -var="notification_identifier=xxx"
```

The following variables are required to be passed to the Terraform code:

```
account_name
notification_identifier
```

account_name: This is the name of the AWS account that will be provisioned.

notification_identifier: This is the identifier that will be included with the aws-accounts@ptp.cloud email notification.

The following variables are optional to be passed to the Terraform code:

```
session_duration
```

session_duration: This is the duration of the AWS SSO session that will be used to provision the AWS SSO connector. The default value is 43200 seconds (12 hour).
