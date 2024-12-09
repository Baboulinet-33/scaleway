variable "cluster_name" {
  description = "Nom du cluster Kapsule"
  type        = string
}

variable "region" {
  description = "Région Scaleway"
  type        = string
}

variable "zone" {
  description = "Zone Scaleway"
  type        = string
}

variable "project_id" {
  description = "ID du projet Scaleway"
  type        = string
}

variable "cluster_version" {
  description = "Version de Kubernetes"
  type        = string
}

variable "cni" {
  description = "CNI à utiliser"
  type        = string
  default     = "cilium"
}

variable cluster_type {
  description = "Type de cluster à créer"
  type = string
  default = "kapsule"
}

variable "pools" {
  description = "Liste des pools de nœuds"
  type = map(object({
    node_type   = string
    size        = number
    autoscaling = bool
    min_size    = number
    max_size    = number
  }))
  # default = [{
  #   tag = ""
  # }]
}