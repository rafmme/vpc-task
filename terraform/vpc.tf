resource "aws_vpc" "rafmme_vpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags {
      Name = "Rafmme VPC"
  }
}

