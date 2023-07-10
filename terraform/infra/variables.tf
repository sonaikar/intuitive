variable "region" {
  type    = string
  default = "us-west-2"
}

variable "vm-count" {
  type    = number
  default = 2
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "route_cidr" {
  type = string
  default = "10.0.1.0/24"
}

variable "ebs_size" {
  type    = number
  default = 10
}

variable "ebs_volumes" {
  type    = number
  default = 2
}

variable "availability_zone" {
  type    = string
  default = "us-west-2a"
}

variable "type" {
  description = "The type of EBS volume"
  type        = string
  default     = "standard"
}

variable "create_vpc" {
  default = true
}

variable "bucket_name" {
  default = "intuitive-s3"
}

variable "ssh_key_name" {
  type    = string
  default = "vm-ssh.pub"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}