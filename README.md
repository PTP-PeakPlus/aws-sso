# PTP AWS SSO

Set up the Enterprise Application in Azure and have the metadata URL available.

```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum install -y terraform
git clone https://github.com/PTP-PeakPlus/aws-sso.git
cd aws-sso
terraform init
terraform apply -auto-approve -var="azure_metadata_url=xxxx"
terraform output aws_iam_access_key
terraform output aws_iam_access_secret

```
