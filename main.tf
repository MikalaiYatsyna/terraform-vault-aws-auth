locals {
  user_arn = data.aws_caller_identity.this.arn
  user     = split(":user/", local.user_arn)[1]
}
resource "vault_auth_backend" "aws_auth" {
  type = "aws"
}

resource "vault_policy" "aws_iam" {
  name   = "aws_auth_policy"
  policy = data.vault_policy_document.aws_auth_policy.hcl
}

resource "vault_aws_auth_backend_role" "aws_backend_role" {
  depends_on               = [vault_auth_backend.aws_auth]
  backend                  = vault_auth_backend.aws_auth.path
  role                     = "aws_auth"
  auth_type                = "iam"
  token_ttl                = 60
  token_max_ttl            = 120
  token_policies           = [vault_policy.aws_iam.name]
  bound_iam_principal_arns = [local.user_arn]
}

resource "aws_iam_access_key" "access_key" {
  user = local.user
}

resource "vault_aws_auth_backend_client" "auth_backend_client" {
  backend    = vault_auth_backend.aws_auth.path
  access_key = aws_iam_access_key.access_key.id
  secret_key = aws_iam_access_key.access_key.secret
}
