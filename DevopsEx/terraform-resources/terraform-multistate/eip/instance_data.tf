data "terraform_remote_state" "ServiceAppVM" {
  backend = "s3"
  config {
    bucket = "serviceapp-terraformbucket"
    key    = "remotebackendterraform.tfstate"
    region = "us-east-1"
  }
}
