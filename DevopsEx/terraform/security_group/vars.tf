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
