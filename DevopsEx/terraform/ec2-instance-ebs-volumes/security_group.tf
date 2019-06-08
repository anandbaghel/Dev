#Create security group for ec2-instance
resource "aws_security_group" "varginia_sg" {
  vpc_id = "${aws_vpc.main.id}"
  name = "varginia_sg"

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  
   ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    from_port   = "8080"
    to_port     = "8090"
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
}
