data "aws_ip_ranges" "security_ec2" {
  regions  = ["us-west-1", "us-east-1"]
  services = ["ec2"]
}

resource "aws_security_group" "from_varginia" {
  name = "from_varginia"

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    from_port   = "8080"
    to_port     = "8090"
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  tags {
    CreateDate = "${data.aws_ip_ranges.security_ec2.create_date}"
  }
}
