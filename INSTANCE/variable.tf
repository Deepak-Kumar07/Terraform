variable "region" {
  type        = string
  description = "Instance Region"
  default     = "ap-south-1"
}
variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAi+3H5bFmAiGfjLzpSUz5rIzJTtn4knnM+TQ9wDOfFlytTDx5xvXq13oDYXfusxRxCmeMz5lVw8ZkbBM11YwPpwtHV5j8jLxmJWkrVK+Xow6EW3UheG/xkPCZ5/NqmT8kB6T4QSVefCUHY9hp2WWgWuJEVkQhxsbxJHGyVRJvOK3YnY1/S"
}
variable "pub-instance_type" {
  type    = string
  default = "t2.micro"
}
variable "pvt-instance_type" {
  type    = string
  default = "t2.micro"
}
variable "pub-ami" {
  type    = string
  default = "ami-08df646e18b182346"
}
variable "pvt-ami" {
  type    = string
  default = "ami-068257025f72f470d"
}
