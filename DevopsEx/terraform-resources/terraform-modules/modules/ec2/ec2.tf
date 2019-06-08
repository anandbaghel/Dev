resource "aws_instance" "ProvisionerVM" {
  ami = "${var.instance_ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"

  tags {
    Name = "Provisioner_Instance"
  }
}
