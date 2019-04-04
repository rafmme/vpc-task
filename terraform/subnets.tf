# Resource for creation of a Public Subnet within the VPC
resource "aws_subnet" "rafmme_public_subnet" {
  # id for the VPC
  vpc_id = "${aws_vpc.rafmme_vpc.id}"

  #cidr block range for the subnet 
  cidr_block = "${var.public_subnet_cidr}"

  # availability zone within the specified AWS region
  availability_zone = "${var.aws_availabilty_zone}"

  tags {
    Name = "Rafmme VPC Public Subnet"
  }
}

# Resource for creation of a Private Subnet within the VPC
resource "aws_subnet" "rafmme_private_subnet" {
  # id for the VPC
  vpc_id = "${aws_vpc.rafmme_vpc.id}"

  #cidr block range for the subnet 
  cidr_block = "${var.private_subnet_cidr}"

  # availability zone within the specified AWS region
  availability_zone = "${var.aws_availabilty_zone}"

  tags {
    Name = "Rafmme VPC Private Subnet"
  }
}

