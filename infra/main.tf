terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "rosstimson"

    workspaces {
      name = "run-rosstimson"
    }
  }
}
