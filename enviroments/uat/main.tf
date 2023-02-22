module "vpc" {
  source  = "terraform-google-modules/network/google"
  project_id   = var.gcp_project
  network_name = var.name
  auto_create_subnetworks = false
  shared_vpc_host = false
  routing_mode = "REGIONAL"
  subnets = [
    {
      subnet_name           = "${var.env}-subnet"
      subnet_ip             = "172.26.1.0/28"
      subnet_region         = var.gcp_region
      subnet_private_access = "true"
    },
  ]
}


module "app_infra" {
  source = "git::https://github.com/cloudwise-devops/testing-with-terraform-module.git"
  gcp_project = var.gcp_project
  gcp_region  = var.gcp_region
  name = var.name
  env = var.env
  vcn_name = module.vpc.network_name
  vcn_subnetwork = module.vpc.subnets_names.0
  buckets_create  = true
}