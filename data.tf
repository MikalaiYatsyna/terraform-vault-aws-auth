data "vault_policy_document" "aws_auth_policy" {
  rule {
    path         = "secret/*"
    capabilities = ["create", "read", "update", "patch", "delete", "list"]
    description  = "allow all on secrets"
  }
  rule {
    path         = "auth/token/*"
    capabilities = ["create", "read", "update", "patch", "delete", "list"]
  }

  rule {
    path         = "sys/mounts"
    capabilities = ["create", "read", "update", "patch", "delete", "list"]
  }
  rule {
    path         = "sys/mounts/*"
    capabilities = ["create", "read", "update", "patch", "delete", "list"]
  }
}

data "aws_caller_identity" "this" {}

data "aws_secretsmanager_secret_version" "root_token" {
  secret_id = var.vault_token_secret_id
}
