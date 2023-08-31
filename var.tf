# VPC

variable "vpc_cidr_block" {
  description = "cidr_block"
}
variable "vpc_name" {
  description = "name of the vpc"
}
variable "enable_dns_hostnames" {
  description = "enable_dns_hostnames"
}

# public Subnets 1 and 2 

# public Subnet1
variable "publicsubnet1_cidr_block" {
  description = "cidr block"
}
variable "availability_zone1" {
  description = "availability_zone1"
}
variable "publicsubnet1_name" {
  description = "name of the subnet"
}

# public Subnet2

variable "publicsubnet2_cidr_block" {
  description = "cidr block"
}
variable "availability_zone2" {
  description = "availability_zone2"
}
variable "publicsubnet2_name" {
  description = "name of the subnet"
}

# private Subnets 1 and 2

# private subnet1
variable "privatesubnet1_cidr_block" {
  description = "cidr block"
}
variable "privatesubnet1_name" {
  description = "name of the subnet"
}

# private subnet2

variable "privatesubnet2_cidr_block" {
  description = "cidr block"
}
variable "privatesubnet2_name" {
  description = "name of the subnet"
}

# database subnets 1 and 2

# database subnet2
variable "dbsubnet1_cidr_block" {
  description = "cidr block"
}
variable "dbsubnet1_name" {
  description = "name of the subnet"
}

# database subnet2

variable "dbsubnet2_cidr_block" {
  description = "cidr block"
}
variable "dbsubnet2_name" {
  description = "name of the subnet"
}


# internet gateway

variable "igw_name" {
  description = "name of the internet gateway"
}

# NAT gateway

variable "nat_name1" {
  description = "name of the nat gateway"
}
variable "nat_name2" {
  description = "name of the nat gateway"
}

# Route table

variable "rt_cidr_block" {
  description = "rt_cidr_block"
}
variable "rt_name1" {
  description = "name of the public route table"
}

variable "rt_name2" {
  description = "name of the private route table 1"
}
variable "rt_name3" {
  description = "name of the private route table 2"
}

variable "rt_name4" {
  description = "name of the database route table 1"
}
variable "rt_name5" {
  description = "name of the database route table 2"
}


# security groups 