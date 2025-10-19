output "buket2_id" {
    description = "ID of the first s3 bucket1"
    value = aws_s3_bucket.bucket_1.id
}

output "bucket2_id" {
    description = "ID of the first s3 bucket 2"
    value = aws_s3_bucket.bucket_2.id
}