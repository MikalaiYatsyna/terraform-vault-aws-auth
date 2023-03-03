## Introduction
Terraform module to enable AWS IAM authentication on Vault

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.57.0 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 3.13.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.access_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [vault_auth_backend.aws_auth](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/auth_backend) | resource |
| [vault_aws_auth_backend_client.auth_backend_client](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/aws_auth_backend_client) | resource |
| [vault_aws_auth_backend_role.aws_backend_role](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/aws_auth_backend_role) | resource |
| [vault_policy.aws_iam](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [aws_caller_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [vault_policy_document.aws_auth_policy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vault_address"></a> [vault\_address](#input\_vault\_address) | Vault http address | `string` | n/a | yes |
| <a name="input_vault_token"></a> [vault\_token](#input\_vault\_token) | Vault http address | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_name"></a> [role\_name](#output\_role\_name) | Name of vault role to use for authentication |
<!-- END_TF_DOCS -->
