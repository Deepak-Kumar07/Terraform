#Terraform Block
terraform {
  required_version = "~> 1.2.5"
  required_providers {
    aws = {
      version = "~> 2.7.0"
      source  = "hashicorp/aws"
    }
  }
}
#Proider Block
provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}
module "vpc-module" {
  source = "./VPC"
}
module "sg-module" {
  source = "./SG"
}
module "instance" {
  source = "./INSTANCE"
}