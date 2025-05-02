## variables.tf

#S3 Bucket

variable "bucket_name" {
  description = "Nombre del bucket S3"
  type        = string
  default     = "reyGasExpress-app-files-1234567890"  # Aquí puedes cambiar el nombre por uno único
}

# Cognito User Pool

variable "cognito_user_pool_name" {
  description = "Nombre del User Pool de Cognito"
  type        = string
  default     = "reyGasExpress-user-pool"
}

variable "cognito_user_pool_client_name" {
  description = "Nombre del Cliente de Cognito"
  type        = string
  default     = "reyGasExpress-client"
}

# IAM

variable "lambda_execution_role_name" {
  description = "Nombre del rol de ejecución de Lambda"
  type        = string
  default     = "lambda-execution-role-reyGasExpress"
}

# Lambda

variable "lambda_function_name" {
  description = "Nombre de la función Lambda"
  type        = string
  default     = "reyGasExpress-hello-world"
}

variable "lambda_runtime" {
  description = "Runtime de la función Lambda"
  type        = string
  default     = "nodejs18.x"
}

variable "lambda_function_zip" {
  description = "Ruta del archivo ZIP con el código de Lambda"
  type        = string
  default     = "lambda_function_payload.zip"
}

# API Gateway

variable "api_gateway_name" {
  description = "Nombre de la API Gateway"
  type        = string
  default     = "reyGasExpress-api"
}

variable "api_stage_name" {
  description = "Nombre del stage para la API Gateway"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}