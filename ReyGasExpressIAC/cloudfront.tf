resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket_website_configuration.website_config.website_endpoint
    origin_id   = "S3Origin-${aws_s3_bucket.reyGasExpress_app_files.id}"

    custom_origin_config {
      http_port               = 80
      https_port              = 443
      origin_protocol_policy  = "http-only"
      origin_ssl_protocols    = ["TLSv1.2"]
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = var.cloudfront_default_root_object

  default_cache_behavior {
    allowed_methods  = var.cloudfront_allowed_methods
    cached_methods   = var.cloudfront_cached_methods
    target_origin_id = "S3Origin-${aws_s3_bucket.reyGasExpress_app_files.id}"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
      headers = var.cloudfront_forward_origin_headers ? ["Origin"] : []
    }

    viewer_protocol_policy = var.cloudfront_viewer_protocol_policy
    min_ttl                = 0
    default_ttl            = var.cloudfront_default_ttl
    max_ttl                = var.cloudfront_max_ttl
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