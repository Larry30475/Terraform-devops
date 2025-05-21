variable "instance_type" {
  type    = string
  default = "t2.micro"
}

locals {
  environment = terraform.workspace

  instance_type = (
    terraform.workspace == "prod" ? "t3.medium" :
    terraform.workspace == "staging" ? "t3.small" :
    "t2.micro"
  )

  name_tag = "web-${local.environment}"
}

variable "name_tag" {
  description = "Name tag for the instance"
  type        = string
  default     = "MyEC2Instance"
}

variable "ami" {
  description = "AMI ID to use for the instance"
  type        = string
  default     = "ami-084568db4383264d4"
}