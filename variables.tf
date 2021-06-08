variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "CICDDemoInstance"
}

variable "INSTANCE_SSH_PUBLIC_KEY" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
}

variable "default_subnet" {
  type    = string
  default = "subnet-c02464e1"
}

variable "alloc_id" {
  type    = string
  default = "eipalloc-09fc8e792c9619457"
}
