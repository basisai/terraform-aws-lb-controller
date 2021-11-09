terraform {
  required_version = ">= 0.14"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.28"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2"
    }
    http = {
      source = "hashicorp/http"
      version = ">= 2.1"
    }
  }
}
