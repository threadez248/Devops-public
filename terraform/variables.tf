# Variables for general information
######################################
 
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}
 
variable "aws_region_az" {
  description = "AWS region availability zone"
  type        = string
  default     = "a"
}

# Variables for Instance
######################################
 
variable "instance_ami" {
  description = "ID of the AMI used"
  type        = string
  default     = "ami-0d5eff06f840b45e9"
}
 
variable "instance_type" {
  description = "Type of the instance"
  type        = string
  default     = "t2.medium"
}
 
variable "key_pair" {
  description = "SSH Key pair used to connect"
  type        = string
  default     = "threadez"
}
 
variable "root_device_type" {
  description = "Type of the root block device"
  type        = string
  default     = "gp2"
}
 
variable "root_device_size" {
  description = "Size of the root block device"
  type        = string
  default     = "10"
}

variable "owner" {
  description = "Configuration owner"
  type        = string
  default = "itmunk"
}