# The AWS instance resource for creating the frontend instance inside the public subnet within the VPC
resource "aws_instance" "frontend" {
  ami = "${var.frontend-ami-id}"
  availability_zone = "${var.aws_availabilty_zone}"
  instance_type = "${var.instance_type}"
  key_name = "${var.keyPairName}"
  vpc_security_group_ids = ["${aws_security_group.frontend-sg.id}"]
  subnet_id = "${aws_subnet.rafmme_public_subnet.id}"
  associate_public_ip_address = true

  tags {
    Name = "Frontend Instance"
  }
}


# The AWS instance resource for creating the Bastion host inside the public subnet within the VPC
resource "aws_instance" "bastion-host" {
  ami = "${var.bastion-image-id}"
  availability_zone = "${var.aws_availabilty_zone}"
  instance_type = "${var.instance_type}"
  key_name = "${var.keyPairName}"
  vpc_security_group_ids = ["${aws_security_group.bastion-nat-sg.id}"]
  subnet_id = "${aws_subnet.rafmme_public_subnet.id}"
  associate_public_ip_address = true

  tags {
    Name = "Bastion Host"
  }
}


# The AWS instance resource for creating the NAT instance inside the public subnet within the VPC
resource "aws_instance" "nat-instance" {
  ami = "${var.nat-instance-image-id}"
  availability_zone = "${var.aws_availabilty_zone}"
  instance_type = "${var.instance_type}"
  key_name = "${var.keyPairName}"
  vpc_security_group_ids = ["${aws_security_group.bastion-nat-sg.id}"]
  subnet_id = "${aws_subnet.rafmme_public_subnet.id}"
  associate_public_ip_address = true
  source_dest_check = false

  tags {
    Name = "NAT Instance"
  }
}


# The AWS instance resource for creating the backend instance inside the private subnet within the VPC
resource "aws_instance" "api_backend" {
  ami = "${var.api-backend-ami-id}"
  availability_zone = "${var.aws_availabilty_zone}"
  instance_type = "${var.instance_type}"
  key_name = "${var.keyPairName}"
  vpc_security_group_ids = ["${aws_security_group.api-backend-sg.id}"]
  subnet_id = "${aws_subnet.rafmme_private_subnet.id}"

  tags {
    Name = "Backend API Instance"
  }
}

# The AWS instance resource for creating the DB instance inside the private subnet within the VPC

resource "aws_instance" "db_instance" {
  ami = "${data.aws_ami.db-image.id}"
  availability_zone = "${var.aws_availabilty_zone}"
  instance_type = "${var.instance_type}"
  key_name = "${var.keyPairName}"
  vpc_security_group_ids = ["${aws_security_group.db-sg.id}"]
  subnet_id = "${aws_subnet.rafmme_private_subnet.id}"

  tags {
    Name = "Database Instance"
  }
}

