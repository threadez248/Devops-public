variable "instance_ami" {
  description = "ID of the AMI used"
  type        = string
  default     = "**"
}

variable "key_pair" {
  description = "SSH Key pair used to connect"
  type        = string
  default     = ""
}

variable "instance_count" {
  default = "2"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

Terrafoem Steps:

terraform init

terraform plan

terraform apply
