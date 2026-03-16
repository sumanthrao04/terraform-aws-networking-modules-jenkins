environment          = "prod"
vpc_cidr             = "10.20.0.0/16"
public_subnet_cidrs  = ["10.20.1.0/24", "10.20.2.0/24"]
private_subnet_cidrs = ["10.20.11.0/24", "10.20.12.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]
instance_type        = "t3.micro"
ami_id               = "ami-0c02fb55956c7d316"