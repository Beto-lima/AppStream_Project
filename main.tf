provider "aws" {
  region = var.region
}

module "iam" {
  source    = "./modules/iam"
  env = var.env
  role_name = "${var.env}-appstream-role"
}

module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs
  tags = {
    Project = var.project
    Env     = var.env
  }
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "logs-${var.project}-${var.env}-${random_string.suffix.result}"
  tags        = module.vpc.tags
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

module "appstream" {
  source         = "./modules/appstream"
  fleet_name     = "${var.env}-fleet"
  stack_name     = "${var.env}-stack"
  instance_type  = var.instance_type
  instance_count = var.instance_count
  iam_role_arn   = module.iam.iam_role_arn
  subnet_ids     = module.vpc.private_subnet_ids
  tags           = module.vpc.tags
}

module "cloudwatch" {
  source         = "./modules/cloudwatch"
  log_group_name = "/appstream/logs"
  tags           = module.vpc.tags
}

resource "null_resource" "associate_fleet_stack" {
  provisioner "local-exec" {
    command = "FLEET_NAME=${module.appstream.fleet_name} STACK_NAME=${module.appstream.stack_name} REGION=us-east-1 bash ./scripts/associate-fleet-stack.sh"
  }

  depends_on = [
    module.appstream
  ]
}
