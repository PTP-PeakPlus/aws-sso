# PTP AWS SSO

Set up the Enterprise Application in Azure and have the metadata URL available.

```
sudo yum install -y yum-utils; sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo; sudo yum install -y terraform; git clone https://github.com/PTP-PeakPlus/aws-sso.git; cd aws-sso; terraform init; terraform apply -auto-approve -var="azure_metadata_url=xxxx"
```

Go to AWS SecretsManager to access they key information needed to complete automated user provisisoning in Azure..

To update trust policy...

```
git clone https://github.com/PTP-PeakPlus/aws-sso.git && python aws-sso/scripts/update-policy.py
```

```
aws sso login --profile ptp-secure-access
export AWS_PROFILE=`python3 scripts/set-profile.py 164682547053`
```
