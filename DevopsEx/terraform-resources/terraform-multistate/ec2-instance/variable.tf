variable "instance_ami" {
    default = "ami-0c6b1d09930fac512"
}
variable "instance_type" {
    default = "t2.micro"
}

variable "vpc_cidrblock" {
    default = "10.0.0.0/16"
    description = "ServiceApp-cidrblock"
}

variable "public_subnet1_cidr" {
    description = "pucblic subnet2 CIDR"
  
}

variable "public_subnet2_cidr" {
    description = "pucblic subnet2 CIDR"
  
}

variable "public_subnet3_cidr" {
    description = "pucblic subnet3 CIDR"
  
}
variable "private_subnet1_cidr" {
    description = "private subnet1 CIDR"
  
}
variable "private_subnet2_cidr" {
    description = "private subnet2 CIDR"
  
}
variable "private_subnet3_cidr" {
    description = "private subnet3 CIDR"
  
}