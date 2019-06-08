resource "aws_key_pair" "ssh_key" {
 key_name = "ssh_key"
 public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "new_instance" {
ami	= "${lookup(var.AMIS, var.AWS_REGION)}"
instance_type = "t2.micro"
tags {
 name = "Terraform"
 os   = "centos"
 }

provisioner "file" {
 source = "install.sh"
 destination = "/tmp/install.sh"
}

provisioner "remote-exec" {
inline = [
  "chmod +x /tmp/install.sh",
  "sudo /tmp/install.sh"
]
}

connection {
user = "${var.INSTANCE_USERNAME}"
private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
}
}
