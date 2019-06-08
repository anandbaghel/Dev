resource "aws_instance" "ProvisionerVM" {
  ami = "${var.instance_ami}"
  instance_type = "${var.machine_type}"
  security_groups = ["${aws_security_group.ProvisionerSG.name}"]
  key_name = "${var.key_name}"

  tags {
    Name = "Provisioner_Instance"
  }
  provisioner "remote-exec" {
    inline = [
       "sudo yum install -y httpd",
       "sudo service httpd start"
    ]
    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = "${file("./${var.key_name}.pem")}"
    }
  }
}
