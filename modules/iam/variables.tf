variable "role_name" {
  type        = string
  description = "IAM Role name for AppStream"
}

variable "env" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}