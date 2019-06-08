resource "aws_eip" "ServiceApp-ip-for-natgw" {
  vpc                       = true 
  associate_with_private_ip = "10.0.0.7/16"
  tags {
      Name = "ServiceApp-EIP"
  }
}
