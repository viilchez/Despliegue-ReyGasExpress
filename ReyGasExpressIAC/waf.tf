# 1. Crear un Web ACL (Web Access Control List)
resource "aws_wafv2_web_acl" "reyGasExpress_waf" {
  name        = "reyGasExpress-web-acl"
  scope       = "CLOUDFRONT" # El scope debe ser CLOUDFRONT para distribuciones de CloudFront
  default_action {
    allow {} # Acción por defecto: permitir todas las solicitudes que no coincidan con ninguna regla
  }
  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "reyGasExpressWebACL"
    sampled_requests_enabled   = true
  }

  # 2. Agregar reglas (ejemplos básicos - necesitarás ajustarlas según tus necesidades)

  # Regla para bloquear solicitudes de direcciones IP específicas (ejemplo)
  # rule {
  #   name     = "BlockSpecificIPs"
  #   priority = 1
  #   action {
  #     block {}
  #   }
  #   statement {
  #     ip_set_reference_statement {
  #       arn = aws_wafv2_ip_set.blocked_ips.arn # Necesitarías crear un aws_wafv2_ip_set
  #     }
  #   }
  #   visibility_config {
  #     cloudwatch_metrics_enabled = true
  #     metric_name                = "BlockSpecificIPsMetric"
  #     sampled_requests_enabled   = true
  #   }
  # }

  # Regla para bloquear solicitudes que coincidan con firmas comunes de ataques (ejemplo - AWS Managed Rule Group)
  rule {
    name     = "AWS-ManagedRulesCommonRuleSet"
    priority = 10
    override_action {
      none {}
    }
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSCommonRulesMetric"
      sampled_requests_enabled   = true
    }
  }

  tags = {
    Environment = "dev" # O tu entorno
    Application = "reyGasExpress"
  }
}