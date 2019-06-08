resource "aws_subnet" "ServiceApp-Private-Subnet1" {
    cidr_block          = "${var.private_subnet1_cidr}"
    vpc_id              = "${aws_vpc.ServiceApp-VPC.id}"
    availability_zone   = "us-east-1a"
    tags {
        Name = "ServiceApp-Private-Subnet1"
    }
}
resource "aws_subnet" "ServiceApp-Private-Subnet2" {
    cidr_block          = "${var.private_subnet2_cidr}"
    vpc_id              = "${aws_vpc.ServiceApp-VPC.id}"
    availability_zone   = "us-east-1b"
    tags {
        Name = "ServiceApp-Private-Subnet2"
    }
}
resource "aws_subnet" "ServiceApp-Private-Subnet3" {
    cidr_block          = "${var.private_subnet3_cidr}"
    vpc_id              = "${aws_vpc.ServiceApp-VPC.id}"
    availability_zone   = "us-east-1b"
    tags {
        Name = "ServiceApp-Private-Subnet3"
    }
}