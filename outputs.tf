output "role_name" {
  description = "Name of vault role to use for authentication"
  value       = vault_aws_auth_backend_role.aws_backend_role.role
}
