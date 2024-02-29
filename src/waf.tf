# creating aws-waf-cloudfront

module "waf-webaclv2" {
  source      = "umotif-public/waf-webaclv2/aws"
  version     = "5.1.2"
  name_prefix = "dynamics-waf-cf_dist" # insert the 1 required variable here
}