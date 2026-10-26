terraform {
  backend "s3" {
    bucket         = "soat-terraform-state-fernando-db"
    key            = "db-infra/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}