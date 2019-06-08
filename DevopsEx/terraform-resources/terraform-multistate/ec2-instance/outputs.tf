output "vpc_id" {
  value = "${aws_vpc.ServiceApp-VPC.id}"
}

output "vpc_cidr_block" {
  value = "${aws_vpc.ServiceApp-VPC.cidr_block}"
}
output "public_subnet1_cidr" {
  value = "${aws_subnet.ServiceApp-Public-Subnet1.cidr_block}"
}
output "public_subnet2_cidr" {
  value = "${aws_subnet.ServiceApp-Public-Subnet2.cidr_block}"
}
output "public_subnet3_cidr" {
  value = "${aws_subnet.ServiceApp-Public-Subnet3.cidr_block}"
}
output "private_subnet1_cidr" {
  value = "${aws_subnet.ServiceApp-Private-Subnet1.cidr_block}"
}

output "private_subnet2_cidr" {
  value = "${aws_subnet.ServiceApp-Private-Subnet2.cidr_block}"
}

output "private_subnet3_cidr" {
  value = "${aws_subnet.ServiceApp-Private-Subnet3.cidr_block}"
}

