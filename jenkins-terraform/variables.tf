# Variables for general information
######################################
 
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_count" {
  default = "1"
} 

variable "instance_tags" {
  type = list
  default = ["Jenkins-Master"]
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
  default     = "ami-0aeeebd8d2ab47354"
}
 
variable "instance_type" {
  description = "Type of the instance"
  type        = string
  default     = "t2.micro"
}
 
variable "key_pair" {
  description = "SSH Key pair used to connect"
  type        = string
  default     = "itmunkdev"
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
