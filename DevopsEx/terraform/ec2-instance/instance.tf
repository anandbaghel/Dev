resource "aws_instance" "new_instance" {
ami	= "${lookup(var.AMIS, var.AWS_REGION)}"
instance_type = "t2.micro"
tags {
 name = "Terraform"
 os   = "centos"
 }
provisioner "local-exec" {
 command = "echo ${aws_instance.new_instance.private_ip} >> private_ips.txt"
 }
}
output "ip" {
 value= "${aws_instance.new_instance.public_ip}"
}
