terraform {
  required_version = ">= 1.5.0"
  required_providers {
    kubernetes = { source = "hashicorp/kubernetes", version = "~> 2.32" }
    helm       = { source = "hashicorp/helm",       version = "~> 2.13" }
  }
  backend "local" {
    path = "..\\..\\test\\terraform.tfstate"
  }  
}



provider "kubernetes" {
  config_path = "C:\\Users\\Windows 10\\.kube\\config" 
}

provider "helm" {
  kubernetes {
    config_path = "C:\\Users\\Windows 10\\.kube\\config"
  }
}
