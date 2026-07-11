output "cluster_name" {

  value = module.eks.cluster_name

}

output "cluster_endpoint" {

  value = module.eks.endpoint

}

output "vpc_id" {

  value = module.vpc.vpc_id

}

output "repository_url" {

  value = module.ecr.repository_url

}