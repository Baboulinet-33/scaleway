module "scaleway" {
  source = "./modules/scaleway"

  project_id      = var.project_id
  cluster_name    = "st-test-byoc"
  region          = "fr-par"
  zone            = "fr-par-2"
  cluster_version = "v1.30.2"

  pools = {
    poolcpu = {
      node_type   = "DEV1-M"
      size        = 3
      autoscaling = true
      min_size    = 1
      max_size    = 5
    },
    # poolgpu = {
    #   node_type   = "H100-1-M"
    #   size        = 1
    #   autoscaling = false
    #   min_size    = 1
    #   max_size    = 1
    # },
  }
}

# module "helm" {
# source     = "./modules/helm"
# lb_ip      = module.scaleway.lb_ip
# lb_zone    = "fr-par-1"
# kubeconfig = module.scaleway.kubeconfig
# cluster_id = module.scaleway.cluster_id
# }


output "lb_ip" {
  description = "Ip of the LB"
  value       = module.scaleway.lb_ip
}


# resource "null_resource" "my_resource" {
# properties = var.map_properties
# }

# output "resource_properties" {
#   value = {
# for key, prop in null_resource.my_resource.property: 
# key => prop.name
#   }
# }
