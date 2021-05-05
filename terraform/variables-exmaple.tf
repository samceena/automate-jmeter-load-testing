variable "key_name" {
  type      =   string
  default  =   "" 
}

variable "vpc_id" {
  type      =   string
  default  =   ""
}

variable "cidr_blocks" {
  type       = list(string)
  default    = ["74.90.241.202/32"] //Your IP Address
}

variable "default_vpc_security_group_id" {
  type      = string
  default   = "" // default VPC security group
}

variable "private_subnet_id" {
  type      = string
  default   = ""
}

variable "private_subnet_id_us_east_1a" {
  type      = string
  default   = ""
}

variable "public_subnet_id" {
  type      = string
  default   = ""
}

variable "instance_count_6" {
  type      = number
  default   = 6
}

variable "other_security_group_id" {
  type      = string
  default   = ""
}