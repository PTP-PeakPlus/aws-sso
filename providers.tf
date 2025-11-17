terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.2.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "azuread" {
  tenant_id     = jsondecode(data.aws_secretsmanager_secret_version.graph_api.secret_string)["tenantId"]
  client_id     = jsondecode(data.aws_secretsmanager_secret_version.graph_api.secret_string)["clientId"]
  client_secret = jsondecode(data.aws_secretsmanager_secret_version.graph_api.secret_string)["clientSecret"]
}
