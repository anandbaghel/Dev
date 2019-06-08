#Create a Volume for ec2 instance
resource "aws_ebs_volume" "ec2-ebs-volume" {
 availability_zone = "us-east-1a"
 size = 20
 type = "gp2"
 tags {
  Name = "ec2-ebs-volume"
 }
}

#Attach Volume to ec2 instance
resource "aws_volume_attachment" "ec2-ebs-volume-attachment" {
 device_name = "/dev/xvdh"
 volume_id = "${aws_ebs_volume.ec2-ebs-volume.id}"
 instance_id = "${aws_instance.ec2-instance.id}"
}
