#Terraform Block
terraform {
  required_version = "~> 1.2.5"
}

module "vpc-module" {
  source = "../VPC"
}

#Resouce Block
resource "aws_security_group" "Win_SG" {
  name        = "allow_RDP"
  description = "Allow RDP to take remote session"
  vpc_id      = module.vpc-module.vpc-id
  ingress {
    cidr_blocks = [module.vpc-module.vpc-block]
    description = "Allow RDP in Public Subnet"
    from_port   = var.rdp-form-port
    to_port     = var.rdp-to-port
    protocol    = var.win-protocol
  }
  egress {
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
  }
}
resource "aws_security_group" "Linux_SG" {
  name        = "allow_SSH"
  description = "Allow SSH to manage remotely session"
  vpc_id      = module.vpc-module.vpc-id
  ingress {
    cidr_blocks = [module.vpc-module.vpc-block]
    description = "Allow SSH in Private Subnet"
    from_port   = var.ssh-form-port
    to_port     = var.ssh-to-port
    protocol    = var.linux-protocol
  }
  egress {
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
  }
}   