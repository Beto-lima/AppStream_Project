resource "aws_cloudwatch_log_group" "appstream_logs" {
  name              = var.log_group_name
  retention_in_days = 14
  tags              = var.tags
}