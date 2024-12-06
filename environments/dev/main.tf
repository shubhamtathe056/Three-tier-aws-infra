module "ec2" {
  source      = "../../modules/ec2"
  instances = {
  "dev-instance-1" = {
    ami_id        = "ami-0e2c8caa4b6378d8c", 
    instance_type = "t2.micro", 
    name          = "dev-instance-1", 
    subnet_id     = module.vpc.public_subnet_ids[0]
  },
  "dev-instance-2" = {
    ami_id        = "ami-0e2c8caa4b6378d8c", 
    instance_type = "t2.micro", 
    name          = "dev-instance-2", 
    subnet_id     = module.vpc.public_subnet_ids[1]
  },
  "dev-instance-3" = {
    ami_id        = "ami-0e2c8caa4b6378d8c", 
    instance_type = "t2.micro", 
    name          = "dev-instance-3", 
    subnet_id     = module.vpc.private_subnet_ids[0]
  },
  "dev-instance-4" = {
    ami_id        = "ami-0e2c8caa4b6378d8c", 
    instance_type = "t2.micro", 
    name          = "dev-instance-4", 
    subnet_id     = module.vpc.private_subnet_ids[1]
  }
}
  environment = "dev"
}



module "s3" {
  source      = "../../modules/s3"
  bucket_names = {
    "bucket1" = { bucket_name = "tathe6536-bucket1" },
    "bucket2" = { bucket_name = "tathe6536-bucket2" },
    "bucket3" = { bucket_name = "tathe6536-bucket3" },
    "bucket4" = { bucket_name = "tathe6536-bucket4" }
  }
  environment = "dev"
}

module "vpc" {
  source                = "../../modules/vpc"
  vpc_cidr              = "10.0.0.0/16"
  vpc_name              = "my-vpc"
  public_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs  = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones    = ["us-east-1", "us-east-2"]
  
  environment = "dev"
}