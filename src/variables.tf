variable "region" {
  description = "The aws region to use"
  type        = string
  default     = "us-east-1"
}

variable "bucket_prefix" {
  description = "The prefix for the s3 bucket name"
  type        = string
  default     = "cf-s3-website-"
}

variable "domain_name" {
  description = "The domain name to use"
  type        = string
  default     = "sctp-sandbox.com"
}

locals {
  website_domain = "dynamics.${var.domain_name}"
}

variable "web_acl_arn" {
  description = "The ARN of the WAFv2 WebACL"
  type        = string
}

variable "web_acl_id" {
  description = "The ID of the WAFv2 WebACL"
  type        = string
}