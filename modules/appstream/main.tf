resource "aws_appstream_fleet" "fleet" {
  name           = var.fleet_name
  instance_type  = var.instance_type
  fleet_type     = "ON_DEMAND"
  iam_role_arn   = var.iam_role_arn
  compute_capacity {
    desired_instances = var.instance_count
  }
  vpc_config {
    subnet_ids = var.subnet_ids
  }
  tags = var.tags
}

resource "aws_appstream_stack" "stack" {
  name = var.stack_name
  tags = var.tags
}

