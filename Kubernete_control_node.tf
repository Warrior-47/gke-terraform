resource "google_container_cluster" "primary" {
  name            = "primary"
  location        = "us-central1"
  network         = google_compute_network.terraform_vpc.id
  subnetwork      = google_compute_subnetwork.restricted_subnet.id
  networking_mode = "VPC_NATIVE"

  enable_autopilot = true

  release_channel {
    channel = "REGULAR"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "k8s-pod-range-1"
    services_secondary_range_name = "k8s-service-range-1"
  }

  private_cluster_config {
    enable_private_nodes   = true
    master_ipv4_cidr_block = "172.16.0.0/28"

  }
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = google_compute_subnetwork.management_subnet.ip_cidr_range
      display_name = "my-cidr"
    }
    cidr_blocks {
      cidr_block   = var.cli_ip
      display_name = "cloud_cli"
    }
  }
}
