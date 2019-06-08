resource "aws_eip" "DevopsEIP" {
  instance = "${aws_instance.DevopsVM.id}"
}
