# Create a GKE cluster
resource "google_container_cluster" "primary" {
  name               = "${var.project_id}-gke"
  location           = var.zone
  initial_node_count = 1
  remove_default_node_pool = true
}

resource "google_container_node_pool" "primary_pool" {
  name = "${google_container_cluster.primary.name}-nodepool"
  cluster = google_container_cluster.primary.id

  node_config {
    machine_type = var.machine_type
    disk_size_gb = 20
    disk_type    = "pd-standard"
    preemptible  = var.is_preemptible_node_pool
    tags         = ["gke-node", "${var.project_id}-gke"]
  }

  autoscaling {
    min_node_count = 0
    max_node_count = 1
  }
}
