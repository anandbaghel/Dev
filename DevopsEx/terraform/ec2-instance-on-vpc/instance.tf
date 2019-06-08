resource "aws_instance" "new_instance" {
 ami = "${lookup(var.AMIS, var.AWS_REGION)}"
 instance_type = "t2.micro"
 tags {
  name = "Terraform"
 }
 
# Added subnet
subnet_id = "${aws_subnet.main-pubsubnet-1.id}"

# Added security group
vpc_security_group_ids = ["${aws_security_group.varginia_sg.id}"]
}

output "ip" {
 value= "${aws_instance.new_instance.public_ip}"
}
