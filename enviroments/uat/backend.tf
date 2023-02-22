terraform {
  required_version = ">= 1.1.0"
  backend "gcs" {
    bucket  = "terraform-state-demo-220223"
    prefix  = "gce/live/uat"
  }
}
