resource "aws_vpc" "ServiceApp-VPC" {
    cidr_block = "${var.vpc_cidrblock}"
    enable_dns_hostnames = true 
    tags {
     Name = "ServiceApp-VPC"
    }  
}
