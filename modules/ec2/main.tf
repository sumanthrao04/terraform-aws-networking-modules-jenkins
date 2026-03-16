resource "aws_security_group" "app_sg" {
  name        = "${var.environment}-private-ec2-sg"
  description = "Security group for private EC2 instance"
  vpc_id      = var.vpc_id

  ingress {
  description = "Allow SSH from VPC only"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = [var.vpc_cidr]
}

ingress {
  description = "Allow HTTP from VPC only"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = [var.vpc_cidr]
}

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-private-ec2-sg"
    Environment = var.environment
    Project     = "terraform-aws-networking-modules-jenkins"
  }
}

resource "aws_instance" "private_app" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [aws_security_group.app_sg.id]
  associate_public_ip_address = false

  user_data = file("${path.module}/../../scripts/install_nginx.sh")

  tags = {
    Name        = "${var.environment}-private-app-instance"
    Environment = var.environment
    Project     = "terraform-aws-networking-modules-jenkins"
  }
}