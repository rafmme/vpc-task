resource "aws_subnet" "rafmme_public_subnet" {
  vpc_id = "${aws_vpc.rafmme_vpc.id}"

  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "${var.aws_availabilty_zone}"

  tags {
    Name = "Rafmme VPC Public Subnet"
  }
}

resource "aws_subnet" "rafmme_private_subnet" {
  vpc_id = "${aws_vpc.rafmme_vpc.id}"

  cidr_block = "${var.private_subnet_cidr}"
  availability_zone = "${var.aws_availabilty_zone}"

  tags {
    Name = "Rafmme VPC Private Subnet"
  }
}

