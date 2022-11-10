resource "aws_s3_bucket" "relxAutomation" {
  bucket = "relxautomation1"
  #acl = "private"
  acl = "public-read"
  # versioning {
  #  enabled = true
  #}

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    name = "bucket of static website"
  }



}

resource "aws_s3_bucket_object" "relxAutomation-object" {
  for_each = fileset(path.module, "**/*.html")
  bucket   = aws_s3_bucket.relxAutomation.id
  key      = each.value
  source   = "${path.module}/${each.value}"
  #source = "/Users/rahul/Desktop/relx/index.html"

}



# resource "aws_s3_bucket_policy" "relxAutomation-policy" {
#   bucket = aws_s3_bucket.relxAutomation.id
#   policy = data.aws_iam_policy_document.default.json

# }

# data "aws_iam_policy_document" "relxAutomation-iam" {
#   statement {
#     action    = ["s3:GetObject"]
#     resources = ["${aws_s3_bucket.bucket.arn}/*"]
#     principals {
#       type        = "AWS"
#       identifiers = ["*"]

#     }
#   }








