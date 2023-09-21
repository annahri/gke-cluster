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

provider "helm" {
  kubernetes {
    host = "https://${google_container_cluster.primary.endpoint}"
    cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)
    token = data.google_client_config.client.access_token
  }
}
