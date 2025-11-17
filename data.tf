data "aws_secretsmanager_secret" "graph_api" {
  arn = "arn:aws:secretsmanager:us-east-1:600468852607:secret:prod/api/graph/credentials-jW6P57"
}

data "aws_secretsmanager_secret_version" "graph_api" {
  secret_id = data.aws_secretsmanager_secret.graph_api.id
}
