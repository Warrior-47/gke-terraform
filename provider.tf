provider "google" {
  project     = var.project
  region      = "us-central1"
  credentials = file("cred.json")
}

# terraform {
#   backend "gcs" {
#     bucket = "tf-state-2030"
#     prefix = "terraform/state"
#   }
# }
