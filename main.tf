#terraform


resource "aws_s3_bucket" "bucket" {
    bucket = "ccs-test-terraform-ccs"
    tags = {
        Name = "Buc"
        CreatedBy = "Sandeep"
    }
}

resource "aws_s3_bucket_public_access_block" "accessblk" {
    bucket = aws_s3_bucket.bucket.id

    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true

}


resource "aws_s3_bucket" "logbucket" {
    bucket = "my-logg-cc-test-cc"
}

resource "aws_s3_bucket_public_access_block" "accessblklog" {
    bucket = aws_s3_bucket.logbucket.id

    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true

}


resource "aws_s3_bucket_logging" "logexp" {
  bucket = aws_s3_bucket.bucket.id

  target_bucket = aws_s3_bucket.logbucket.id
  target_prefix = "log/"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_versioning" "versioning_example1" {
  bucket = aws_s3_bucket.logbucket.id
  versioning_configuration {
    status = "Enabled"
  }
}




#--------------------------------------------------------
# S3 bucket creation with Versioning Enabled
#--------------------------------------------------------



resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.example.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.example.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}
#-------------------------------------------------------------
# Dynamodb table creation
#-------------------------------------------------------------
resource "aws_dynamodb_table" "terraform-lock-ddb" {
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "LockId"
  name             = "terraform-lock-ddbt"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "LockId"
    type = "S"
  }
} 


terraform {
  backend "s3" {
    key            = "terraform.tfstate"
    bucket         = "terraform-up-and-running-statezpl-ccs"
    region         = "us-east-1"
    dynamodb_table = "terraform-up-and-running-locks-ccs"
  }
}