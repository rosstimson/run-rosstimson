# Note the switch to an aliased provider here.  This is just to
# quickly switch to the us-east-1 region as Cloudfront needs the ACM
# cert in us-east-1.
resource "aws_acm_certificate" "ross_run_cert" {
  provider          = aws.acm
  domain_name       = var.domain
  validation_method = "DNS"

  tags = {
    Name        = "${var.domain} ACM Cert"
    Terraform   = "true"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Get the R53 zone ID as this will be needed in a few places.
data "aws_route53_zone" "zone" {
  name         = var.domain
  private_zone = false
}

resource "aws_route53_record" "cert_validation" {
  name     = aws_acm_certificate.ross_run_cert.domain_validation_options[0].resource_record_name
  type     = aws_acm_certificate.ross_run_cert.domain_validation_options[0].resource_record_type
  zone_id  = data.aws_route53_zone.zone.id
  records  = [aws_acm_certificate.ross_run_cert.domain_validation_options[0].resource_record_value]
  ttl      = 60
}

resource "aws_acm_certificate_validation" "cert" {
  provider                = aws.acm
  certificate_arn         = aws_acm_certificate.ross_run_cert.arn
  validation_record_fqdns = [aws_route53_record.cert_validation.fqdn]
}
