data "aws_iam_policy_document" "relxAutomation-policy" {
  statement {
    actions = [
      "s3:*"
    ]
    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.relxAutomation.id}/*"
    ]
  }
}