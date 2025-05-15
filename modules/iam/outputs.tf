output "iam_role_arn" {
  value = aws_iam_role.appstream_role.arn
  description = "IAM role ARN"
}
