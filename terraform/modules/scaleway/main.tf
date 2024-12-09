

resource "scaleway_vpc_private_network" "lab_private_network" {
  project_id = var.project_id
  name = "lab_pic_vpc"
}

resource "scaleway_k8s_cluster" "cluster" {
  project_id = var.project_id
  name       = var.cluster_name
  version    = var.cluster_version
  cni        = var.cni
  type       = var.cluster_type

  private_network_id = scaleway_vpc_private_network.lab_private_network.id
  delete_additional_resources = true
}

resource "scaleway_k8s_pool" "pools" {
  for_each   = var.pools
  cluster_id = scaleway_k8s_cluster.cluster.id

  name       = each.key
  node_type  = each.value.node_type
  size       = each.value.size

  autoscaling = each.value.autoscaling
  min_size    = each.value.min_size
  max_size    = each.value.max_size
}

resource "scaleway_lb_ip" "lab_nginx_ip" {  
  zone       = var.zone
  project_id = scaleway_k8s_cluster.cluster.project_id
}
