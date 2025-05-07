locals {
  cluster_name = "eks-${random_string.suffix.result}"
  
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}



module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.36.0"

  cluster_name    = local.cluster_name
  cluster_version = "1.32"

  cluster_endpoint_public_access           = false
  enable_cluster_creator_admin_permissions = true

  vpc_id     = local.vpcid
  subnet_ids = local.subnet_ids

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 3
      desired_size = 1
      capacity_type  = "SPOT"
      ami_type        = "AL2_x86_64"  # Explicitly set x86_64
      labels = {
        arch = "x86_64"
      }

    }

    two = {
      name = "node-group-2"

      instance_types = ["t4g.small"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
      capacity_type  = "SPOT"
      ami_type        = "AL2_ARM_64"
      labels = {
        arch = "arm64"
      }

    }
  }
}