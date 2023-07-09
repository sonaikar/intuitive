locals {
  org-name  = "my-org"
  dept-name = "my-dept"
  common-tags = {
    prefix = "${local.org-name}-${local.dept-name}"
  }
}

resource "random_string" "stg-random" {
  length  = 6
  upper   = false
  special = false
}


module "storage" {
  source = "git@github.com:sonaikar/modules.git//storage?ref=v1.0.18"

  size              = var.ebs_size
  ebs_volumes       = var.ebs_volumes
  availability_zone = var.availability_zone
  type              = var.type
}

module "network" {
  source = "git@github.com:sonaikar/modules.git//network?ref=v1.0.18"

  vm-count          = var.vm-count
  cidr              = var.cidr
  public_subnets    = [var.public_subnets]
  create_vpc        = var.create_vpc
  region            = var.region
  availability_zone = var.availability_zone
 route_cidr = var.route_cidr
}

module "compute" {
  source = "git@github.com:sonaikar/modules.git//compute?ref=v1.0.18"

  vm-count          = var.vm-count
  security_group_id = module.network.ssh_security_group_id
  subnet_id         = module.network.subnet_id
  ebs_volume_id     = module.storage.ebs_volume_id
  ssh_key_name      = var.ssh_key_name
  instance_type     = var.instance_type
}

module "s3" {
  source = "git@github.com:sonaikar/modules.git//s3?ref=v1.0.18"

  bucket_name = var.bucket_name
}