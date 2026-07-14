module "eks" {

  source = "terraform-aws-modules/eks/aws"

  version = "~> 20.0"

  cluster_name = var.cluster_name

  cluster_version = "1.31"

  subnet_ids = var.subnet_ids

  cluster_endpoint_public_access = true

  enable_irsa = true

  eks_managed_node_groups = {

    default = {

      instance_types = ["t3.medium"]

      desired_size = 2

      min_size = 2

      max_size = 4

    }

  }

}