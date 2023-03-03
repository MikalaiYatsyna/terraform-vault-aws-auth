variable "vault_address" {
  type = string
  description = "Vault http address"
}

variable "vault_token" {
  type = string
  description = "Vault http address"
  sensitive = true
}
