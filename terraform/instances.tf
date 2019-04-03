resource "aws_instance" "frontend" {
  ami = "${data.aws_ami.frontend-image.id}"
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

resource "aws_instance" "bastion-host" {
  ami = "${data.aws_ami.bastion-ami-image.id}"
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

resource "aws_instance" "nat-instance" {
  ami = "${data.aws_ami.nat-ami-image.id}"
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

resource "aws_instance" "api_backend" {
  ami = "${data.aws_ami.api-backend-image.id}"
  availability_zone = "${var.aws_availabilty_zone}"
  instance_type = "${var.instance_type}"
  key_name = "${var.keyPairName}"
  vpc_security_group_ids = ["${aws_security_group.api-backend-sg.id}"]
  subnet_id = "${aws_subnet.rafmme_private_subnet.id}"

  tags {
    Name = "Backend API Instance"
  }
}

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

