import boto3
import json

def find_value_anywhere(data, target):
    if isinstance(data, dict):
        if target in data.keys() or target in data.values():
            return True
        return any(find_value_anywhere(value, target) for value in data.values())
    elif isinstance(data, list):
        return any(find_value_anywhere(item, target) for item in data)
    else:
        return data == target

iam = boto3.client('iam')

roles = ["PTP-AdminRole", "PTP-IAMAdminRole", "PTP-PowerUserRole", "PTP-ReadOnlyRole"]
for role in roles:
	response = iam.get_role(RoleName=role)

	trust_policy = response['Role']['AssumeRolePolicyDocument']

	if not find_value_anywhere(trust_policy, "arn:aws:sts::842675975653:assumed-role/AWSReservedSSO_cli-secure-access_*"):
		trust_policy['Statement'].append({
			"Effect": "Allow",
			"Principal": {
				"AWS": "arn:aws:iam::842675975653:root"
			},
			"Action": "sts:AssumeRole",
			"Condition": {
				"StringLike": {
					"aws:PrincipalArn": "arn:aws:sts::842675975653:assumed-role/AWSReservedSSO_cli-secure-access_*"
				}
			}
		})

		response = iam.update_assume_role_policy(
			RoleName=role,
			PolicyDocument=json.dumps(trust_policy)
		)
		print(role + " was updated.")
	else:
		print("No update was required for " + role + ".")
