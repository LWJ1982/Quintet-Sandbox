output "cf_domain" {
  value = module.static_web_stack.cloudfront_domain
}

output "cf_id" {
  value = module.static_web_stack.cloudfront_id
}

output "bucket_name" {
  value = module.static_web_stack.bucket_name
}

output "alt_domain_name" {
  value = "${local.domain_prefix}.${local.zone_name}"
}