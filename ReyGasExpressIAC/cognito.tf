# Cognito User Pool
resource "aws_cognito_user_pool" "reyGasExpress_user_pool" {
  name = var.cognito_user_pool_name

  password_policy {
    minimum_length    = 8
    require_uppercase = true
    require_numbers   = true
    require_symbols   = true
  }

  alias_attributes = ["email"] 
}

# Cognito User Pool Client
resource "aws_cognito_user_pool_client" "reyGasExpress_user_pool_client" {
  name         = var.cognito_user_pool_client_name
  user_pool_id = aws_cognito_user_pool.reyGasExpress_user_pool.id
  generate_secret = false

  explicit_auth_flows = [
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_SRP_AUTH"
  ]
}