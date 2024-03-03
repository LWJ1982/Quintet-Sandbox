# create S3 Bucket:
resource "aws_s3_bucket" "bucket" {
  bucket_prefix = var.bucket_prefix #prefix appends with timestamp to make a unique identifier
  tags = {
    "Project"   = "Use CloudFront with s3"
    "ManagedBy" = "Quintet-Grp3"
  }
  force_destroy = true
}

# create bucket ACL :
resource "aws_s3_bucket_ownership_controls" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.bucket_acl]

  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}


# enable bucket versioning
resource "aws_s3_bucket_versioning" "bucket-ver" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# block public access :
resource "aws_s3_bucket_public_access_block" "public_block" {
  bucket                  = aws_s3_bucket.bucket.id
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}
# encrypt bucket using SSE-S3:
resource "aws_s3_bucket_server_side_encryption_configuration" "encrypt" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
# create S3 website hosting:
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}
# add bucket policy to let the CloudFront OAI get objects:
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.bucket_policy_document.json
}

#upload website files to s3:
locals {
  mime_types = {
    "css"  = "uploads/css",
    "html" = "uploads/html",
    "png"  = "assets/png",
    "jpeg" = "image/jpeg",
    "jpg"  = "image/jpeg"
  }
}

resource "aws_s3_object" "object" {
  for_each     = fileset("./uploads/", "**/*.*")
  bucket       = aws_s3_bucket.bucket.id
  key          = each.value
  source       = "./uploads/${each.value}"
  content_type = lookup(tomap(local.mime_types), element(split(".", each.value), length(split(".", each.value)) - 1))
  etag         = filemd5("./uploads/${each.value}")
}