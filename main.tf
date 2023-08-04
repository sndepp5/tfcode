#terraform


resource "aws_s3_bucket" "bucket" {
    bucket = "${var.bucket-name}"
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

resource "aws_s3_bucket_acl" "bacl" {
    bucket = aws_s3_bucket.bucket.id
    acl = "private"
}

resource "aws_s3_bucket" "logbucket" {
    bucket = "my-logg-cc"
}

resource "aws_s3_bucket_public_access_block" "accessblklog" {
    bucket = aws_s3_bucket.logbucket.id

    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true

}

resource "aws_s3_bucket_acl" "logacl" {
    bucket = aws_s3_bucket.logbucket.id
    acl = "log-delivery-write"
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

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.logbucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
