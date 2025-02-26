import os
import sys

# Set AWS profile
if sys.argv[1]:
	with open(os.path.expanduser('~') + "/.aws/config", "r+") as f:
		if f"[profile {sys.argv[1]}]" not in f.read():

			# Update SSH config file
			f.write(f"[profile {sys.argv[1]}]\n")
			f.write(f"role_arn = arn:aws:iam::{sys.argv[1]}:role/PTP-AdminRole\n")
			f.write(f"source_profile = ptp-secure-access\n")

		print(sys.argv[1])
else:
	print("Please provide an AWS account number.")
