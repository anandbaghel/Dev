resource "aws_route" "ServiceApp-nat-gateway-route" {
    route_table_id          = "${aws_route_table.ServiceApp-Private-Route-Table.id}"
    nat_gateway_id          = "${aws_nat_gateway.ServiceApp-nat-gateway.id}"
    destination_cidr_block  = "0.0.0.0/0"
}

resource "aws_route" "ServiceApp-public-internet-gateway-route" {
    route_table_id          = "${aws_route_table.ServiceApp-Public-Route-Table.id}"
    gateway_id              = "${aws_internet_gateway.ServiceApp-internet-gatewat.id}"
    destination_cidr_block  = "0.0.0.0/0"
}
