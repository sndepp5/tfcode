#terraform pls


resource "aws_s3_bucket" "bucket" {
    bucket = "ccs-test-terraform-ccs369"
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
    bucket = "my-logg-cc-test-ccs369"
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

resource "aws_s3_bucket" "bucket3" {
    bucket = "ccs-terraform-ccs36999"
    tags = {
        Name = "Buck"
        CreatedBy = "Sandeep"
    }
}

resource "aws_s3_bucket" "bucket9" {
    bucket = "tesla-sndepp"
    tags = {
        Name = "Buck"
        CreatedBy = "Sandeep"
    }
}

resource "aws_vpc" "vpc" {
  cidr_block              = "10.0.0.0/16"
  enable_dns_hostnames    = true
  enable_dns_support      = true

  tags      = {
    Name    = "DemoVPC"
  }
}
