data "google_compute_image" "my_image" {
  name    = "ubuntu-2004-focal-v20221018"
  project = "ubuntu-os-cloud"
}

data "google_service_account" "compute-engine-acc" {
  account_id = var.service_acc_email
}

resource "google_compute_instance" "gke_controller" {
  name         = "jenkins-master"
  machine_type = "e2-small"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
    }
  }

  network_interface {
    network    = google_compute_network.terraform_vpc.name
    subnetwork = google_compute_subnetwork.management_subnet.id
    access_config {}
  }
  metadata = {
    startup-script = "./Script.sh"
  }

  service_account {
    email  = data.google_service_account.compute-engine-acc.email
    scopes = [
	"https://www.googleapis.com/auth/devstorage.read_only",
	"https://www.googleapis.com/auth/logging.write",
	"https://www.googleapis.com/auth/monitoring.write",
	"https://www.googleapis.com/auth/pubsub",
	"https://www.googleapis.com/auth/service.management.readonly",
	"https://www.googleapis.com/auth/servicecontrol",
	"https://www.googleapis.com/auth/trace.append"
	]
  }
}
