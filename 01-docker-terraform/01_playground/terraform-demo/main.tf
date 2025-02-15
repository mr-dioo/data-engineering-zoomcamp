terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.20.0"
    }
  }
}

provider "google" {
  project = "ha-do-terraform-practice"
  region  = "europe-west2"
}


resource "google_storage_bucket" "demo-bucket" {
  name          = "ha-saves-in-bucket"
  location      = "EU"
  force_destroy = true


  lifecycle_rule {
    condition {
      age = 1
    }

    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}