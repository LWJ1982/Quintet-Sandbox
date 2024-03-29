locals {
  domain_prefix = "quintet-cloudfront"
  zone_name     = "sctp-sandbox.com"
}

module "static_web_stack" {
  source = "../modules/cloudfront-s3"

  acm_certificate_arn = module.acm.acm_certificate_arn
  aliases             = ["${local.domain_prefix}.${local.zone_name}"]
  web_acl_id          = module.waf.web_acl_arn
}

module "waf" {
  source = "../modules/waf"

  providers = {
    aws = aws.us-east-1
  }
}

module "acm" {
  #checkov:skip=CKV_TF_1:Ensure Terraform module sources use a commit hash
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  providers = {
    aws = aws.us-east-1
  }

  domain_name       = "${local.domain_prefix}.${local.zone_name}"
  zone_id           = data.aws_route53_zone.prod.zone_id
  validation_method = "DNS"
}

module "records" {
  #checkov:skip=CKV_TF_1:Ensure Terraform module sources use a commit hash
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = local.zone_name

  records = [
    {
      name = "${local.domain_prefix}"
      type = "A"
      alias = {
        name    = "${module.static_web_stack.cloudfront_domain}"
        zone_id = "Z2FDTNDATAQYW2"
      }
    },
  ]
}

#upload website files to s3:
locals {
  mime_types = {
    "css"  = "text/css",
    "html" = "text/html",
    "png"  = "image/png",
    "jpeg" = "image/jpeg",
    "jpg"  = "image/jpeg"
  }
}

resource "aws_s3_object" "object" {
  for_each     = fileset("../uploads/", "**/*.*")
  bucket       = module.static_web_stack.bucket_name
  key          = each.value
  source       = "../uploads/${each.value}"
  content_type = lookup(tomap(local.mime_types), element(split(".", each.value), length(split(".", each.value)) - 1))
  etag         = filemd5("../uploads/${each.value}")
}