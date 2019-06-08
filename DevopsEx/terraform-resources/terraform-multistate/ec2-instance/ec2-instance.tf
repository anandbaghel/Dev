resource "aws_instance" "ServiceAppVM" {
  ami = "${var.instance_ami}"
  instance_type = "${var.instance_type}"
  tags {
    Name = "MultistateVM"
  }
}

output "seip" {
  value = "${aws_instance.ServiceAppVM.id}"
}
