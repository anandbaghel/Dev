resource "aws_instance" "ProvisionerVM" {
  ami = "${var.instance_ami}"
  instance_type = "${lookup(var.instance_type, terraform.workspace)}"
  key_name = "${var.key_name}"

  tags {
    Name = "Provisioner_Instance"
  }
}
