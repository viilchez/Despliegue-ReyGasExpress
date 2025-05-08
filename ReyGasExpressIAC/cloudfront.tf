resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket_website_configuration.website_config.website_endpoint
    origin_id   = "S3Origin-${aws_s3_bucket.reyGasExpress_app_files.id}"

    custom_origin_config {
      http_port               = 80
      https_port              = 443
      http_protocol           = "http-only"
      https_protocol          = "https-only"
      origin_protocol_policy  = "http-only"
      origin_ssl_protocols    = ["TLSv1.2"]
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3Origin-${aws_s3_bucket.reyGasExpress_app_files.id}"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
      headers = ["Origin"]
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  depends_on = [
    aws_s3_bucket_website_configuration.website_config,
    aws_s3_bucket_policy.public_read_policy
  ]
}

output "cloudfront_domain" {
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
  description = "El nombre de dominio de la distribución de CloudFront"
}