variable "region" {
  type        = string
  description = "Instance Region"
  default     = "ap-south-1"
}
variable "cidr_block" {
  description = "cidr Block for VPC"
  type        = string
  default     = "10.31.0.0/16"
}
variable "Pub_subnet_cidr" {
  description = "cidr Block for Public Subnet"
  type        = string
  default     = "10.31.10.0/24"
}
variable "Pvt_subnet_cidr" {
  description = "cidr Block for Public Subnet"
  type        = string
  default     = "10.31.20.0/24"
}
variable "Pub_az" {
  description = "Availibility Zone for Public Subnet"
  type        = string
  default     = "ap-south-1a"
}
variable "Pvt_az" {
  description = "Availibility Zone for Public Subnet"
  type        = string
  default     = "ap-south-1b"
}
