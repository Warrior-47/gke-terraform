provider "google" {
  credentials = file("cred.json")
}

module "gke_auth" {
  source       = "terraform-google-modules/kubernetes-engine/google//modules/auth"
  depends_on   = [google_container_cluster.primary]
  project_id   = var.project_id
  location     = var.region
  cluster_name = google_container_cluster.primary.name
}

resource "local_file" "kubeconfig" {
  content  = module.gke_auth.kubeconfig_raw
  filename = "kubeconfig-${var.env_name}"
}

module "gcp-network" {
  source       = "terraform-google-modules/network/google"
  project_id   = var.project_id
  network_name = "${var.network}-${var.env_name}"
  subnets = [
    {
      subnet_name   = "${var.subnetwork}-${var.env_name}"
      subnet_ip     = "10.10.0.0/16"
      subnet_region = var.region
    },
  ]
  secondary_ranges = {
    "${var.subnetwork}-${var.env_name}" = [
      {
        range_name    = var.ip_range_pods_name
        ip_cidr_range = "10.20.0.0/16"
      },
      {
        range_name    = var.ip_range_services_name
        ip_cidr_range = "10.30.0.0/16"
      },
    ]
  }
}

resource "google_container_cluster" "primary" {
    name = "${var.project_id}-gke"
    location = var.region

    network = module.gcp-network.network_name
    subnetwork = module.gcp-network.subnets_names[0]

    enable_autopilot = true
    
    # This is needed so that terraform does not throw error. Should it be empty?
    # Error: googleapi: Error 400: Max pods constraint on node pools for Autopilot clusters should be 32., badRequest
    ip_allocation_policy {}
}

output "cluster_name" {
  description = "Cluster name"
  value       = google_container_cluster.primary.name
}