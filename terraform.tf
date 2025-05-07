
terraform {

  # cloud {
  #   workspaces {
  #     name = "learn-terraform-eks"
  #   }
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.95.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.1"
    }

    
  }

  required_version = "~> 1.3"
}
