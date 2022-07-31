#Terraform Block
terraform {
  required_version = "~> 1.2.5"
}

module "sg-module" {
  source = "../SG"
}
module "vpc-module" {
  source = "../VPC"
}
#Resouce Block
resource "aws_key_pair" "my_pub_Key" {
  key_name   = "my_pub_key"
  public_key = var.public_key
}
resource "aws_instance" "admin_inst" {
  ami             = var.pub-ami
  instance_type   = var.pub-instance_type
  key_name        = aws_key_pair.my_pub_Key.id
  security_groups = ["allow_RDP"]
  subnet_id       = module.vpc-module.pub-subnet
  tags = {
    "Name" = "${local.pub_inst}"
  }
}
resource "aws_instance" "Web-server" {
  ami             = var.pvt-ami
  instance_type   = var.pvt-instance_type
  key_name        = aws_key_pair.my_pub_Key.id
  security_groups = ["allow_SSH"]
  subnet_id       = module.vpc-module.pvt-subnet
  count           = 3
  tags = {
    "Name" = "${local.pvt_inst}-${count.index}"
  }
  user_data = <<-EOF
      #!/bin/sh
      sudo apt-get update
      sudo apt install -y apache2
      sudo systemctl status apache2
      sudo systemctl start apache2
      sudo chown -R $USER:$USER /var/www/html
      sudo echo "<html><body><h1>Hello this is Apache${count.index}</h1></body></html>" > /var/www/html/index.html
      EOF
}
