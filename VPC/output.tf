output "vpc-id" {
  value = aws_vpc.my_vpc.id
}
output "vpc-block" {
  value = aws_vpc.my_vpc.cidr_block
}
output "pub-subnet" {
  value = aws_subnet.Pub_Subnet.id
}
output "pvt-subnet" {
  value = aws_subnet.Pvt_Subnet.id
}