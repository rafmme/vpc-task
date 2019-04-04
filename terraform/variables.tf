# the AWS region/location where the instance will be created
variable "aws_region" {
  default = "eu-west-2"
}

# The Availability Zones
variable "aws_availabilty_zone" {
  default = "eu-west-2a"
}


# The IP block range for the VPC
variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default = "10.0.0.0/16"
}

# The IP block range for the Public Subnet
variable "public_subnet_cidr" {
  description = "CIDR for the Public Subnet"
  default = "10.0.0.0/24"
}

# The IP block range for the Private Subnet
variable "private_subnet_cidr" {
  description = "CIDR for the Private Subnet"
  default = "10.0.1.0/24"
}

# the AWS Instance type for the instance we are creating 
variable "instance_type" {
  description = "AWS Instance type"
  default = "t2.micro"
}

# the name of the keypair we will be using to access the instance created
variable "keyPairName" {
  description = "key pair name"
  default = "newKeyPair"
}

# AMI id for the frontend Instance
variable "frontend-ami-id" {
  default = "ami-03165e2ee3ba2af19"
}

# AMI id for the API Instance
variable "api-backend-ami-id" {
  default = "ami-0165177a6c6cc8e9d"
}

# name given to the AMI that was built with packer
variable "db_ami_name" {}

# AMI id for the Bastion Host
variable "bastion-image-id" {
  default = "ami-07dc734dc14746eab"
}

# AMI id for the NAT Instance
variable "nat-instance-image-id" {
  default = "ami-0a4c5a6e"
}


