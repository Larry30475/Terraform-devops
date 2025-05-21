terraform {
  backend "s3" {
    bucket = "my-tf-state-bucket-east1"
    key    = "env:/dev/terraform.tfstate"
    #key            = "env:/staging/terraform.tfstate"
    #key            = "env:/prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks-east1"
    encrypt        = true
  }
}