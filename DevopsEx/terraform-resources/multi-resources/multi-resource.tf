provider "aws" {
  region = "us-east-1"
  access_key = "XXXXXXXXXXX"
  secret_key = "XXXXXXXXXXX"
}

resource "aws_instance" "DevopsVM" {
  ami = "ami-0c6b1d09930fac512"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.DevOpsSG.name}"]
}

resource "aws_security_group" "DevopsSG" {
  name = "DevOpsSG"
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_eip" "DevopsEIP" {
  instance = "${aws_instance.DevopsVM.id}"
}
