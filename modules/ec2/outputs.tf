output "instance_id" {
  description = "ID of the private EC2 instance"
  value       = aws_instance.private_app.id
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.private_app.private_ip
}

output "security_group_id" {
  description = "Security group ID attached to EC2"
  value       = aws_security_group.app_sg.id
}