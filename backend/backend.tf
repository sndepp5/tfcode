resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-up-and-running-statezpl-ccs"
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

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-up-and-running-locks-ccs"
  hash_key     = "LockID"
  stream_enabled = true
  stream_view_type = "NEW_AND_OLD_IMAGES"
  read_capacity = 20
  write_capacity = 20


  attribute {
    name = "LockID"
    type = "S"
  }
}