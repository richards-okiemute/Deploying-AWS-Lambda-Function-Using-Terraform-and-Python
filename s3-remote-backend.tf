terraform {
  backend "s3" {
    bucket = "terraform-s3-backend77"
    key    = "terraform-tfstate"
    region = "us-west-2"
    dynamodb_table = "terraform-dynamodb"
  }
}
