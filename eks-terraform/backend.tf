terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.25.0"
    }
  }

  backend "s3" {
    bucket = "vinay-s3-1-bucket"
    key    = "k8/terraform.tfstate"
    region = "us-east-1"
  }


}
