# create  VPC

resource "aws_vpc" "vpc1" { 
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    "Name"             = var.vpc_name
  }
}

# create public subnets 1 and 2 

resource "aws_subnet" "publicsubnet1" {
  cidr_block           = var.publicsubnet1_cidr_block
  availability_zone    = var.availability_zone1
  vpc_id               = aws_vpc.vpc1.id
  tags = {
    "Name"             = var.publicsubnet1_name
  }
}
resource "aws_subnet" "publicsubnet2" {
  cidr_block          = var.publicsubnet2_cidr_block
  availability_zone   = var.availability_zone2
  vpc_id              = aws_vpc.vpc1.id
  tags = {
    "Name"            = var.publicsubnet2_name
  }
}

# create private subnets 1 and 2
resource "aws_subnet" "privatesubnet1" {
  cidr_block           = var.privatesubnet1_cidr_block
  availability_zone    = var.availability_zone1
  vpc_id               = aws_vpc.vpc1.id
  tags = {
    "Name"             = var.privatesubnet1_name
  }
}
resource "aws_subnet" "privatesubnet2" {
  cidr_block          = var.privatesubnet2_cidr_block
  availability_zone   = var.availability_zone1
  vpc_id              = aws_vpc.vpc1.id
  tags = {
    "Name"            = var.privatesubnet2_name
  }
}

# create database subnets 1 and 2

resource "aws_subnet" "dbsubnet1" {
  cidr_block           = var.dbsubnet1_cidr_block
  availability_zone    = var.availability_zone1
  vpc_id               = aws_vpc.vpc1.id
  tags = {
    "Name"             = var.dbsubnet1_name
  }
}
resource "aws_subnet" "dbsubnet2" {
  cidr_block          = var.dbsubnet2_cidr_block
  availability_zone   = var.availability_zone2
  vpc_id              = aws_vpc.vpc1.id
  tags = {
    "Name"            = var.dbsubnet2_name
  }
}

# create  Internet gateway

resource "aws_internet_gateway" "igw" {
  vpc_id                 = aws_vpc.vpc1.id
  tags = {
    "Name"               = var.igw_name
  }
}

# create Elastic IP
resource "aws_eip" "nat_eip1" {    
}
resource "aws_eip" "nat_eip2" {    
}

# create NAT Gateway per zone 

resource "aws_nat_gateway" "nat1" {
  subnet_id             = aws_subnet.publicsubnet1.id
  allocation_id         = aws_eip.nat_eip1.id
  tags = {
    "Name"              = var.nat_name1
  }
}
resource "aws_nat_gateway" "nat2" {
  subnet_id             = aws_subnet.publicsubnet2.id
  allocation_id         = aws_eip.nat_eip2.id
  tags = {
    "Name"              = var.nat_name2
  }
}
# create ROUTE TABLES
# public route table 

resource "aws_route_table" "public_rt1" {
  vpc_id                = aws_vpc.vpc1.id
  route {
    cidr_block          = var.rt_cidr_block
    gateway_id          = aws_internet_gateway.igw.id
  }
  tags = {
    "Name"              = var.rt_name1
  }
}
resource "aws_route_table_association" "RTA1" {
  subnet_id             = aws_subnet.publicsubnet1.id
  route_table_id        = aws_route_table.public_rt1.id
}

resource "aws_route_table_association" "RTA2" {
  subnet_id             = aws_subnet.publicsubnet2.id
  route_table_id        = aws_route_table.public_rt1.id
}

# private route table 1 and 2 
# private route table1 

resource "aws_route_table" "privatert1" {
vpc_id                  = aws_vpc.vpc1.id
route {
    cidr_block          = var.rt_cidr_block
    gateway_id          = aws_nat_gateway.nat1.id
  }
  tags = {
    "Name"              = var.rt_name2
  }
}
resource "aws_route_table_association" "RTA3" {
  subnet_id            = aws_subnet.privatesubnet1.id
  route_table_id       = aws_route_table.privatert1.id
}

# private route table2
resource "aws_route_table" "privatert2" {
vpc_id                  = aws_vpc.vpc1.id
route {
    cidr_block          = var.rt_cidr_block
    gateway_id          = aws_nat_gateway.nat2.id
  }
  tags = {
    "Name"              = var.rt_name3
  }
}

resource "aws_route_table_association" "RTA4" {
  subnet_id            = aws_subnet.privatesubnet2.id
  route_table_id       = aws_route_table.privatert2.id
}

# database route table 1 and 2 

# database route table1 
resource "aws_route_table" "db_rt1" {
  vpc_id                = aws_vpc.vpc1.id
  route {
    cidr_block          = var.rt_cidr_block
  }
  tags = {
    "Name"              = var.rt_name4
  }
}
resource "aws_route_table_association" "RTA5" {
  subnet_id             = aws_subnet.dbsubnet1.id
  route_table_id        = aws_route_table.db_rt1.id
}

# database route table2
resource "aws_route_table" "db_rt2" {
  vpc_id                = aws_vpc.vpc1.id
  route {
    cidr_block          = var.rt_cidr_block
  }
  tags = {
    "Name"              = var.rt_name5
  }
}
resource "aws_route_table_association" "RTA5" {
  subnet_id             = aws_subnet.dbsubnet2.id
  route_table_id        = aws_route_table.db_rt2.id
}

# create security groups 

 









