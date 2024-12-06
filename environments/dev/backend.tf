terraform {
  backend "s3" {
    bucket         = "tathe6536-statefile"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}