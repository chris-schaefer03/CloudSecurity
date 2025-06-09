provider "aws" {
  alias  = "default"
  region = var.region
}

resource "random_id" "bucket_id" {
  byte_length = 4
}

data "aws_caller_identity" "current" {}

resource "aws_kms_key" "cloudtrail_key" {
  description         = "KMS key for CloudTrail logs"
  enable_key_rotation = true

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "EnableRootAccess",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      },
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_s3_bucket" "securecloud_logs" {
  bucket   = "securecloud-logs-${random_id.bucket_id.hex}"
  provider = aws.default

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.cloudtrail_key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = {
    Name        = "SecureCloud Logs"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "securecloud_logs_versioning" {
  bucket = aws_s3_bucket.securecloud_logs.id

  versioning_configuration {
    status = "Enabled"
  }
}