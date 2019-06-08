terraform {
  backend "s3" {
    bucket = "myserviceappbucket"
    key    = "remotebackendterraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-lock"
  }
}
