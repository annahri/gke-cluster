variable "project_id" {
  type = string
}

variable "region" {
  type = string
  default = "asia-southeast2"
}

variable "zone" {
  type = string
  default = "asia-southeast2-b"
}

variable "machine_type" {
  type = string
  default = "e2-medium"
}

variable "node_count" {
  default     = 1
  description = "The number of cluster nodes"
}

variable "is_preemptible_node_pool" {
  description = "Whether the nodes in the cluster should be preemptible"
  type        = bool
  default     = true
}
