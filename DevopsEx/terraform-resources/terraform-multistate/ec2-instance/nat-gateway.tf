resource "aws_nat_gateway" "ServiceApp-nat-gateway" {
    allocation_id   = "${aws_eip.ServiceApp-ip-for-natgw.id}"
    subnet_id       = "${aws_subnet.ServiceApp-Public-Subnet1.id}"
    tags = {
        Name = "ServiceApp-nat-gateway"
    }
    depends_on =["aws_eip.ServiceApp-ip-for-natgw"]
}


