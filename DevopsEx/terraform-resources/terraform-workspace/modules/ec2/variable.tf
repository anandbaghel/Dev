variable "instance_ami" {
  default = "ami-0c6b1d09930fac512"
}
variable "instance_type" {
  type = "map"
  default = {
    default = "t2.micro"
    dev = "t2.nano"
    prod = "m4.large"
  }
}
variable "key_name" {
  default = "XXXXXXX"
}
