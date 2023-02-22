terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.53.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
}