output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "aws_appstream_fleet_id" {
  value = module.appstream.fleet_id
}

output "appstream_stack_id" {
  description = "AppStream stack ID"
  value       = module.appstream.stack_id
}
