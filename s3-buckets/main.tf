provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "bucket_1" {
    bucket = var.bucket1
    tags = {
        Name = "vinay_s3_1"
        Environment = "dev"
    }
} 

resource "aws_s3_bucket_versioning" "bucket_ver_1" {
    bucket = aws_s3_bucket.bucket_1.id
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket" "bucket_2" {
    bucket = var.bucket2
    tags =  {
        Name = "vinay_s3_2"
        Environment = "dev"
    }
} 

resource "aws_s3_bucket_versioning" "bucket_ver_2" {
    bucket = aws_s3_bucket.bucket_2.id
    versioning_configuration {
        status = "Enabled"
    }

}