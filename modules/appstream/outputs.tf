output "fleet_id" {
  value       = aws_appstream_fleet.fleet.id
}

output "stack_id" {
  value       = aws_appstream_stack.stack.id
}


output "fleet_name" {
  value = aws_appstream_fleet.fleet.name
}

output "stack_name" {
  value = aws_appstream_stack.stack.name
}