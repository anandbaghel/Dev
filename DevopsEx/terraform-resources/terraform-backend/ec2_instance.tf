resource "aws_instance" "DevopsVM" {
  ami = "ami-0c6b1d09930fac512"
  instance_type = "t2.micro"
}
