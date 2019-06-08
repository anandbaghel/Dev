resource "aws_eip" "ProvisionerEIP" {
  instance = "${aws_instance.ProvisionerVM.id}"
}
