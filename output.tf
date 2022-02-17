
output "s3_state_bucket" {
    value = aws_s3_bucket.state_bucket.id
}

output "locks_table" {
    value = aws_dynamodb_table.locks_table.id
}
