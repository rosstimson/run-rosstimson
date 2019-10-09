# Backend
# -----------------------------------------------------------------------------

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "rosstimson"

    workspaces {
      name = "run-rosstimson"
    }
  }
}

# Provider
# -----------------------------------------------------------------------------

provider "aws" {
  region = var.region
  version = "~> 2.31"
}

# Cloudfront ACM certs must exist in US-East-1 for use with API
# Gateway custom DNS.
provider "aws" {
  alias   = "acm"
  region  = "us-east-1"
  version = "~> 2.31"
}
