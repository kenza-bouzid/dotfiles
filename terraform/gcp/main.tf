provider "google" {
  project     = "virtual-machine-451721"
  region      = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = "dotfiles-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-2404-noble-amd64-v20250214"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
