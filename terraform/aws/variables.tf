# ------------------  utils  ---------------------------

variable "region" {
  default = "eu-west-1"
}

# ------------------  S3  ---------------------------

variable "s3_snippets_web_hosting_name" {
  description = "Nom du bucket"
  type        = string
}