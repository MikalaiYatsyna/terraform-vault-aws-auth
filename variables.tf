variable "vault_address" {
  type        = string
  description = "Vault http address"
  default     = "http://localhost:58065"
}

variable "vault_token_secret_id" {
  type        = string
  description = "Id vault root token secret in AWS Secret Manager"
  sensitive   = true
  default     = "arn:aws:secretsmanager:us-east-2:044964284165:secret:dev-vault-root-token-a13k0P"
}
