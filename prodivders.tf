locals {
  vault_token = jsondecode(data.aws_secretsmanager_secret_version.root_token.secret_string)["token"]
}

provider "aws" {}

provider "vault" {
  address = var.vault_address
  token   = local.vault_token
}
