terraform {
  backend "s3" {
    bucket = "project-terraform-mymattu1"
    key = "main"
    region = "us-east-1"
    dynamodb_table = "my-dynamodb-table"
  }
}
