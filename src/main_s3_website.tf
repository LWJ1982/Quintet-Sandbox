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
resource "aws_s3_object" "object" {
  bucket       = aws_s3_bucket.bucket.id
  for_each     = fileset("uploads/", "*")
  key          = "static-website/${each.value}"
  source       = "uploads/${each.value}"
  etag         = filemd5("uploads/${each.value}")
  content_type = "text/html"
  depends_on = [
    aws_s3_bucket.bucket
  ]
}

#upload png to s3:
resource "aws_s3_object" "object_png" {
  bucket       = aws_s3_bucket.bucket.id
  for_each     = fileset("uploads/assets/", "*")
  key          = "static-website/assets/${each.value}"
  source       = "uploads/assets/${each.value}"
  content_type = "object/png"
}

#upload jpeg to s3:
resource "aws_s3_object" "object_jpeg" {
  bucket       = aws_s3_bucket.bucket.id
  for_each     = fileset("uploads/assets/images/", "*")
  key          = "static-website/assets/images/${each.value}"
  source       = "uploads/assets/images/${each.value}"
  content_type = "object/jpeg"
}

#upload jpg to s3:
resource "aws_s3_object" "object_jpg" {
  bucket       = aws_s3_bucket.bucket.id
  for_each     = fileset("uploads/assets/images/", "*")
  key          = "static-website/assets/images/${each.value}"
  source       = "uploads/assets/images/${each.value}"
  content_type = "object/jpg"
}


# create bucket notification to SNS topic
data "aws_iam_policy_document" "topic" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }

    actions   = ["SNS:Publish"]
    resources = ["arn:aws:sns:*:*:s3-event-notification-topic"]

    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = [aws_s3_bucket.bucket.arn]
    }
  }
}
resource "aws_sns_topic" "topic" {
  name   = "quintet-s3-event-notification-topic"
  policy = data.aws_iam_policy_document.topic.json
}

/* 
resource "aws_s3_bucket" "bucket" {
  bucket = "your-bucket-name"
}
*/

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.bucket.id

  topic {
    topic_arn     = aws_sns_topic.topic.arn
    events        = ["s3:ObjectCreated:*"]
    filter_suffix = ".log"
  }
}