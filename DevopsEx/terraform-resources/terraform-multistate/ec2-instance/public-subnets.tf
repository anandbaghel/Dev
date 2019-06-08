resource "aws_subnet" "ServiceApp-Public-Subnet1" {
    cidr_block          = "${var.public_subnet1_cidr}"
    vpc_id              = "${aws_vpc.ServiceApp-VPC.id}"
    availability_zone   = "us-east-1a"
    tags {
        Name = "ServiceApp-Public-Subnet1"
    }
}
resource "aws_subnet" "ServiceApp-Public-Subnet2" {
    cidr_block          = "${var.public_subnet2_cidr}"
    vpc_id              = "${aws_vpc.ServiceApp-VPC.id}"
    availability_zone   = "us-east-1b"
    tags {
        Name = "ServiceApp-Public-Subnet2"
    }
}

resource "aws_subnet" "ServiceApp-Public-Subnet3" {
    cidr_block          = "${var.public_subnet3_cidr}"
    vpc_id              = "${aws_vpc.ServiceApp-VPC.id}"
    availability_zone   = "us-east-1c"
    tags {
        Name = "ServiceApp-Public-Subnet3"
    }
}