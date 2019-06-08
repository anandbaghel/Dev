resource "aws_route_table" "ServiceApp-Public-Route-Table" {
  vpc_id = "${aws_vpc.ServiceApp-VPC.id}"
  tags {
      Name = "ServiceApp-Public-Route-Table"
  }
}
resource "aws_route_table" "ServiceApp-Private-Route-Table" {
    vpc_id = "${aws_vpc.ServiceApp-VPC.id}"
    tags {
        Name = "ServiceApp-Private-Route-Table"
    }  
}
resource "aws_route_table_association" "ServiceApp-Public-Subnet-Association1" {
    route_table_id  = "${aws_route_table.ServiceApp-Public-Route-Table.id}"
    subnet_id       =  "${aws_subnet.ServiceApp-Public-Subnet1.id}"  
}
resource "aws_route_table_association" "ServiceApp-Public-Subnet-Association2" {
    route_table_id  = "${aws_route_table.ServiceApp-Public-Route-Table.id}"
    subnet_id       =  "${aws_subnet.ServiceApp-Public-Subnet2.id}"  
}
resource "aws_route_table_association" "ServiceApp-Public-Subnet-Association3" {
    route_table_id  = "${aws_route_table.ServiceApp-Public-Route-Table.id}"
    subnet_id       =  "${aws_subnet.ServiceApp-Public-Subnet3.id}"  
}
resource "aws_route_table_association" "ServiceApp-Private-Subnet-Association1" {
    route_table_id  = "${aws_route_table.ServiceApp-Private-Route-Table.id}"
    subnet_id       =  "${aws_subnet.ServiceApp-Private-Subnet1.id}"  
}
resource "aws_route_table_association" "ServiceApp-Private-Subnet-Association2" {
    route_table_id  = "${aws_route_table.ServiceApp-Private-Route-Table.id}"
    subnet_id       =  "${aws_subnet.ServiceApp-Private-Subnet2.id}"  
}
resource "aws_route_table_association" "ServiceApp-Private-Subnet-Association3" {
    route_table_id  = "${aws_route_table.ServiceApp-Private-Route-Table.id}"
    subnet_id       =  "${aws_subnet.ServiceApp-Private-Subnet3.id}"  
}