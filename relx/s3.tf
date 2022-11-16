resource "aws_s3_bucket" "relxAutomation" {
  bucket = var.bucketname
  #acl = "private"
  acl = "public-read"
  # versioning {
  #  enabled = true
  #}
  
    policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "PublicReadForGetBucketObjects",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${var.bucketname}/*"
    }
  ]
}
EOF

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    name = "bucket of static website"
  }



}

# resource "aws_s3_bucket_object" "relxAutomation-object" {
#   for_each = fileset(path.module, "**/*.html")
#   bucket   = aws_s3_bucket.relxAutomation.id
#   key      = each.value
#   source   = "${path.module}/${each.value}"
#   #source = "/Users/rahul/Desktop/relx/index.html"

  bucket   = aws_s3_bucket.relxAutomation.id
  #key      = each.value
  key = "index.html"
  #source   = "${path.module}/${each.value}"
  source = "index.html"
  content_type = "text/html"


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








