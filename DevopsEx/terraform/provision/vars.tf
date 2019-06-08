variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
 default = "us-east-1"
}
variable "AMIS" {
 type = "map"
 default = {
  us-east-1 = "ami-0de53d8956e8dcf80"
  us-east-2 = "ami-0080e4c5bc078760e"
  us-west-1 = "ami-011b3ccf1bd6db744"
   }
}

variable "PATH_TO_PUBLIC_KEY" {
 default = "ssh_key.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
default = "ssh_key"
}

variable "INSTANCE_USERNAME" {
 default = "ec2-user"
}

