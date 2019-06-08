resource "aws_internet_gateway" "ServiceApp-internet-gatewat" {
    vpc_id          = "${aws_vpc.ServiceApp-VPC.id}"
    tags {
     Name = "ServiceApp-internet-gatewat"
    }
}
