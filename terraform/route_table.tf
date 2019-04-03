resource "aws_route_table" "rafmme_vpc_public_rtable" {
  vpc_id = "${aws_vpc.rafmme_vpc.id}"
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.rafmme_vpc_igw.id}"
  }

  tags {
    Name = "Rafmme Public Subnet RT"
  }
}

resource "aws_route_table" "rafmme_vpc_private_rtable" {
  vpc_id = "${aws_vpc.rafmme_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    instance_id = "${aws_instance.nat-instance.id}"
  }

  tags {
    Name = "Rafmme Private Subnet RT"
  }

  depends_on = ["aws_instance.nat-instance"]
}
