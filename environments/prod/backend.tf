terraform {
  backend "s3" {
    bucket         = "sumanthSVC-terraform-state-prod"
    key            = "networking/prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}