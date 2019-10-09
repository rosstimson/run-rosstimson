# S3 Bucket
# -----------------------------------------------------------------------------

resource "random_string" "duplicate_content_penalty_secret" {
  length  = 32
}

data "template_file" "bucket_policy" {
  template = file("website_bucket_policy.json")

  vars = {
    bucket = var.domain
    secret = random_string.duplicate_content_penalty_secret.result
  }
}

resource "aws_s3_bucket" "website_bucket" {
  bucket = var.domain
  policy = data.template_file.bucket_policy.rendered

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Name      = "${var.domain} Website Bucket"
    Terraform = "true"
  }
}
