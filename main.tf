resource "vault_auth_backend" "aws_auth" {
  type = "aws"
}

resource "vault_policy" "aws_iam" {
  name   = "aws_auth_policy"
  policy = data.vault_policy_document.aws_auth_policy.hcl
}

resource "vault_aws_auth_backend_role" "aws_backend_role" {
  backend                  = vault_auth_backend.aws_auth.path
  role                     = "aws_auth"
  auth_type                = "iam"
  token_ttl                = 60
  token_max_ttl            = 120
  token_policies           = [vault_policy.aws_iam.name]
  bound_iam_principal_arns = [data.aws_caller_identity.this.arn]
}

resource "aws_iam_access_key" "ac_key" {
  user = split(":user/", data.aws_caller_identity.this.arn)[1]
}

resource "vault_aws_auth_backend_client" "auth_backend_client" {
  backend    = vault_auth_backend.aws_auth.path
  access_key = aws_iam_access_key.ac_key.id
  secret_key = aws_iam_access_key.ac_key.secret
}
