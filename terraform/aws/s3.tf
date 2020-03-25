# Créer un bucket aws_s3_bucket
resource "aws_s3_bucket" "s3_snippets_web_hosting" {
  bucket        = var.s3_snippets_web_hosting_name
  force_destroy = true
  acl    = "public-read"
  policy = file("s3_policy.json")

  website {
    index_document = "index.html"
  }
}
