module "vpc" {

  source = "./modules/vpc"

  cluster_name = var.cluster_name

  cidr = var.vpc_cidr

  public_subnets = var.public_subnets

  private_subnets = var.private_subnets

}

module "security-group" {

  source="./modules/security-group"

  vpc_id=module.vpc.vpc_id

}

module "eks" {

  source="./modules/eks"

  cluster_name=var.cluster_name

  subnet_ids=module.vpc.private_subnet_ids

  cluster_role_arn=module.iam.cluster_role_arn

  node_role_arn=module.iam.node_role_arn

  security_group_id=module.security-group.security_group_id

}

module "ecr" {

  source="./modules/ecr"

}
