output "aws_region" {
  description = "AWS region used by this configuration"
  value       = data.aws_region.current.region
}
