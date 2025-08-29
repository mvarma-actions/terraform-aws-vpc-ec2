module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
}

module "subnets" {
  source               = "./modules/subnets"
  vpc_id               = module.vpc.vpc_id
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

module "route_tables" {
  source          = "./modules/route_tables"
  vpc_id          = module.vpc.vpc_id
  igw_id          = module.internet_gateway.igw_id
  public_subnets  = module.subnets.public_subnets
  private_subnets = module.subnets.private_subnets
}

module "ec2" {
  source    = "./modules/ec2"
  vpc_id    = module.vpc.vpc_id
  subnet_id = module.subnets.public_subnets[0]
}
