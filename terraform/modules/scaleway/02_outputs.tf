output "cluster_id" {
  value = scaleway_k8s_cluster.cluster.id
}

output "lb_ip" {
  value = scaleway_lb_ip.lab_nginx_ip.ip_address
}

output "vpc_id" {
  value = scaleway_vpc_private_network.lab_private_network.id
}

output "kubeconfig" {
  value = scaleway_k8s_cluster.cluster.kubeconfig[0]
}