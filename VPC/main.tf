#Terraform Block
terraform {
  required_version = "~> 1.2.5"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_block
  tags = {
    "Name" = "${local.vpc_name}"
  }
}
resource "aws_subnet" "Pub_Subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.Pub_subnet_cidr
  availability_zone = var.Pub_az
  tags = {
    "Name" = "${local.Pub_Subnet}"
  }
}
resource "aws_subnet" "Pvt_Subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.Pvt_subnet_cidr
  availability_zone = var.Pvt_az
  tags = {
    "Name" = "${local.Pvt_Subnet}"
  }
}
resource "aws_route_table" "Pub_Route" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    "Name" = "${local.Pub_Route}"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    "Name" = "${local.igw}"
  }
}
resource "aws_route_table_association" "Pub_r" {
  subnet_id      = aws_subnet.Pub_Subnet.id
  route_table_id = aws_route_table.Pub_Route.id
  depends_on     = [aws_internet_gateway.igw]
}
resource "aws_route" "igw_r" {
  route_table_id         = aws_route_table.Pub_Route.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
  depends_on             = [aws_route_table.Pub_Route]
}
resource "aws_route_table" "Pvt_Route" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    "Name" = "${local.Pvt_Route}"
  }
}
resource "aws_route_table_association" "Pvt_r" {
  subnet_id      = aws_subnet.Pvt_Subnet.id
  route_table_id = aws_route_table.Pvt_Route.id
}