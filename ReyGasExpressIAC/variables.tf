#S3 Bucket
variable "bucket_name" {
  description = "Nombre del bucket S3"
  type        = string
  default     = "reygasexpress-app-files-1234567890"
}

variable "aws_region" {
  description = "Región de AWS"
  type        = string
  default     = "us-east-1"
}

#Cognito User Pool
variable "cognito_user_pool_name" {
  description = "Nombre del user pool de Cognito"
  type        = string
  default     = "ReyGasExpress-user-pool"
}

variable "cognito_user_pool_client_name" {
  description = "Nombre del cleinte de Cognito"
  type        = string
  default     = "ReyGasExpress-client"
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

# Rango de direcciones IP privadas para la red principal (VPC)
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

# Rango de direcciones IP para una subred dentro de la VPC
variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

# Zona de disponibilidad en la que se desplegará los recursos (como la subred)
variable "availability_zone" {
  default = "us-east-1a"
}

# Nombre de la base de datos Oracle que se creará dentro de RDS
variable "db_name" {
  default = "reygasdb"
}

# Usuario administrador para la base de datos
variable "db_username" {
  default = "reyGasExpressAdmin"
}

# Contraseña del usuario administrador
variable "db_password" {
  description = "Contraseña de la base de datos"
  sensitive   = true
  default     = "PasswordSegura123"
}

# Tipo de instancia que se usará para RDS
variable "db_instance_class" {
  default = "db.m5.large"
}

# Cantidad de almacenamiento asignado (en GB) para la base de datos
# El mínimo permitido es 20 GB
variable "db_allocated_storage" {
  default = 20
}

variable "my_ip" {
  description = "Tu IP pública"
  default     = "179.6.166.107/32"
}

# CloudFront
variable "cloudfront_default_root_object" {
  description = "El objeto raíz que CloudFront solicita (normalmente index.html)"
  type        = string
  default     = "index.html"
}

variable "cloudfront_allowed_methods" {
  description = "Los métodos HTTP permitidos para los visores"
  type        = list(string)
  default     = ["GET", "HEAD", "OPTIONS"]
}

variable "cloudfront_cached_methods" {
  description = "Los métodos HTTP para los que CloudFront almacena en caché las respuestas"
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "cloudfront_viewer_protocol_policy" {
  description = "Política de protocolo entre el visor y CloudFront"
  type        = string
  default     = "redirect-to-https"
  validation {
    condition = contains(["allow-all", "http-only", "https-only", "redirect-to-https"], var.cloudfront_viewer_protocol_policy)
    error_message = "El valor de cloudfront_viewer_protocol_policy debe ser uno de: allow-all, http-only, https-only, redirect-to-https."
  }
}

variable "cloudfront_default_ttl" {
  description = "Tiempo de vida (en segundos) predeterminado para el caché de CloudFront"
  type        = number
  default     = 3600
}

variable "cloudfront_max_ttl" {
  description = "Tiempo de vida (en segundos) máximo para el caché de CloudFront"
  type        = number
  default     = 86400
}

variable "cloudfront_forward_origin_headers" {
  description = "Indica si se deben reenviar los encabezados 'Origin' al origen (necesario para CORS)"
  type        = bool
  default     = true
}