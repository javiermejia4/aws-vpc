locals {
  region1         = "us-west-2"
  region2         = "us-west-1"
  vpc_cidr        = "10.0.0.0/16"
  public_subnet1  = "10.0.1.0/24"
  private_subnet1 = "10.0.3.0/24"
  private_subnet2 = "10.0.4.0/24"
  private_subnet3 = "10.0.5.0/24"
}

# primary vpc
module "vpc_r1" {
  source             = "terraform-aws-modules/vpc/aws"
  version            = "6.6.0"
  name               = "blackmamba-vpc"
  cidr               = local.vpc_cidr
  azs                = ["${local.region1}a", "${local.region1}b", "${local.region1}c", "${local.region1}d"]
  private_subnets    = [local.private_subnet1, local.private_subnet2, local.private_subnet3]
  public_subnets     = [local.public_subnet1]
  create_vpc         = false
  enable_nat_gateway = false
  enable_vpn_gateway = false
  region             = local.region1
}

# secondary vpc
module "vpc_r2" {
  source             = "terraform-aws-modules/vpc/aws"
  version            = "6.6.0"
  name               = "blackmamba-vpc"
  cidr               = local.vpc_cidr
  azs                = ["${local.region1}a", "${local.region1}b", "${local.region1}c", "${local.region1}d"]
  private_subnets    = [local.private_subnet1, local.private_subnet2, local.private_subnet3]
  public_subnets     = [local.public_subnet1]
  create_vpc         = false
  enable_nat_gateway = false
  enable_vpn_gateway = false
  region             = local.region2

  providers = {
    aws = aws.west2
  }
}