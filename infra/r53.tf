resource "aws_route53_record" "dns" {
  zone_id = data.aws_route53_zone.zone.id
  name    = var.domain
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.website_cdn.domain_name
    zone_id                = aws_cloudfront_distribution.website_cdn.hosted_zone_id
    evaluate_target_health = false
  }
}
