variable "ssh_private_key" {
description = "Private key to connect to EC2 instance."
default = "hello.pem"
}
 
variable "vpc_security_group_ids" {
  type        = string
  default = "sg-e2edc"
  description = "List of security groups associated with your EC2 instance."
}

variable "docker_compose_version" {
  type        = string
  default     = "1.26.0"
  description = "Releases can be found at https://github.com/docker/compose/releases."
}

variable "key_name" {
  type        = string
  default = "hello"
  description = "Specifies the name of an existing Amazon EC2 key pair to enable SSH access to the EC2 instances in your cluster."
}

variable "host_vpc" {
  type = string
  description = "The vpc id where the host will be created."
  default = "vpc-00dfedf" # vpc1
}

variable "host_vpc_subnet" {
  type = string
  description = "The id of the vpc subnet for the host."
  default = "subnet-0afdfaiiiiab881"    
}


variable "host_avail_zone" {
  type = string
  description = "The name of the availability zone for the aws instance."
  default = "ap-south-1a"
}

variable "host_prod" {
  type = string
  description = "Whether the host belongs to Production"
  default = "False"
}

variable "host_dom_is_zone" {
  type = string
  description = "host is part of a domain"
  default = "True"
}

variable "host_project" {
  type = string
  description = "Identifies project that justifies resource."
  default = "AWS-Sentry"
}

variable "host_ec2_schedule" {
  type = string
  description = "Schedule to define the machine running hours"
  default = "ind-office-hours"
}

variable "host_name" {
  type = string
  description = "Identifies host by name."
  default = "aws-mum-sentry"
}

variable "host_owner" {
  type = string
  description = "Identifies host owner."
  default = "aws-sentry"
}

variable "host_working_environment" {
  type = string
  description = "Identifies host working group."
  default = "staging"
}
