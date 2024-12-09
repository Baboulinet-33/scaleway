variable "lb_ip" {
  description = "IP address of the Load Balancer"
  type        = string
}

variable "lb_zone" {
  description = "Load Balancer Zone"
  type        = string
}

variable "kubeconfig" {
  description = "Kubeconfig data for Kubernetes cluster"
  type = map(string)
}

variable "cluster_id" {
  description = "Cluster ID"
  type        = string
}
