variable "instance_type" {
  description = "Type of instance to use"
  type        = string
  default     = "t2.micro"
}
variable "instance_count" {
  description = "Number of instances"
  type        = number
  default     = 2
}
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}