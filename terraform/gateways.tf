# Internet Gateway for the VPC
resource "aws_internet_gateway" "rafmme_vpc_igw" {
  vpc_id = "${aws_vpc.rafmme_vpc.id}"

  tags = {
    Name = "Rafmme IGW"
  }
}
