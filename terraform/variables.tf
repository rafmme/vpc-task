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

variable "PORT" {}
variable "JWT_SECRET" {}
variable "SENDGRID_API_KEY" {}
variable "GOOGLE_CLIENT_ID" {}
variable "GOOGLE_CLIENT_SECRET" {}
variable "FACEBOOK_CLIENT_ID" {}
variable "FACEBOOK_CLIENT_SECRET" {}
variable "LINKEDIN_CLIENT_ID" {}
variable "LINKEDIN_CLIENT_SECRET" {}
variable "TWITTER_CLIENT_ID" {}
variable "TWITTER_CLIENT_SECRET" {}
variable "SESSION_SECRET" {}
variable "PUSHER_APP_ID" {}
variable "PUSHER_KEY" {}
variable "PUSHER_SECRET" {}
variable "PUSHER_CLUSTER" {}
variable "SUPER_ADMIN_ROLE_ID" {}
variable "SUPER_ADMIN_FULLNAME" {}
variable "SUPER_ADMIN_USERNAME" {}
variable "SUPER_ADMIN_EMAIL" {}
variable "SUPER_ADMIN_PASSWORD" {}
variable "SUPER_ADMIN_AUTHTYPEID" {}
