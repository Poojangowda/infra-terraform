module "vpc" {

  source = "terraform-aws-modules/vpc/aws"

  version = "~> 5.0"

  name = "${var.cluster_name}-vpc"

  cidr = var.cidr

  azs = ["ap-south-1a", "ap-south-1b"]

  public_subnets = var.public_subnets

  private_subnets = var.private_subnets

  enable_nat_gateway = true

  single_nat_gateway = true

  enable_dns_support = true

  enable_dns_hostnames = true

  public_subnet_tags = {

    "kubernetes.io/role/elb" = "1"

  }

  private_subnet_tags = {

    "kubernetes.io/role/internal-elb" = "1"

  }

}