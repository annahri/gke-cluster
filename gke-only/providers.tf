terraform {
  required_providers {
    helm = {
      version = ">= 2.9.0"
      source = "hashicorp/helm"
    }
    google = {
      version = ">= 4.58.0"
      source = "hashicorp/google"
    }
  }

  required_version = ">= 0.14.0"
}

# Configure the Google Cloud provider
provider "google" {
  project = var.project_id
  region  = var.region
}
