provider "aws" {
    region = "us-east-1"
    version = "~> v2.0"
}

# terraform {
#   backend "s3"{
#     bucket = "terraform-devops-bootcamp"
#     key = "terraform.tfstate"
#     region = "us-east-1"
#   }
# }

module "myvpc" {
  source = "./modules/vpc/"
  cidr = var.vpc_cidr
  pub_cidr = var.pub_cidr
  azs = var.azs

}

module "myec2" {
  source = "./modules/ec2/"

  vpc-id = module.myvpc.vpc_id
  subnet-id = module.myvpc.subnet_id
  iam_inst_prof = module.myiam.inst-profile
  ami-id = var.ami-id
}

module "myiam" {
  source = "./modules/iam/"
}