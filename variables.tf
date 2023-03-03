variable "vault_address" {
  type        = string
  description = "Vault http address"
}

variable "vault_token" {
  type        = string
  description = "Vault root token"
  sensitive   = true
}
