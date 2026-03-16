module "vpc" {
  source      = "../../modules/vpc"
  vpc_cidr    = var.vpc_cidr
  environment = var.environment
}

module "subnet" {
  source               = "../../modules/subnet"
  vpc_id               = module.vpc.vpc_id
  igw_id               = module.vpc.igw_id
  environment          = var.environment
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

module "ec2" {
  source              = "../../modules/ec2"
  environment         = var.environment
  vpc_id              = module.vpc.vpc_id
  private_subnet_id   = module.subnet.private_subnet_ids[0]
  instance_type       = var.instance_type
  ami_id              = var.ami_id
}