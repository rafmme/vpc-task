# Associating the private subnet with the private route table
resource "aws_route_table_association" "rafmme_private_rt_association" {
  subnet_id = "${aws_subnet.rafmme_private_subnet.id}" 
  route_table_id = "${aws_route_table.rafmme_vpc_private_rtable.id}"
}


# Associating the public subnet with the public route table
resource "aws_route_table_association" "rafmme_public_rt_association" {
  subnet_id = "${aws_subnet.rafmme_public_subnet.id}"
  route_table_id = "${aws_route_table.rafmme_vpc_public_rtable.id}"
}
