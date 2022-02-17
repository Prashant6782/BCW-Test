resource "aws_s3_bucket" "state_bucket" { 

    bucket = "terraform-tf-state"

    versioning {
        enabled = true
    }

    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
}


resource "aws_dynamodb_table" "ddb_table" {
    name = "terraform-tf-dbstate"
    billing_mode = "PAY_PER_REQUEST"
}