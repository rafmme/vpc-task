# the security group for the frontend Instance that will be created
resource "aws_security_group" "frontend-sg" {
  name        = "frontend-sg"
  description = "Security group for the Frontend Instance"

  # inbound tls traffic
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # inbound http traffic
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # inbound ssh traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_cidr}"]
  }

  # outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${aws_vpc.rafmme_vpc.id}"

  tags = {
    Name = "frontend_server_security_group"
  }
}


# the security group for the DB Instance that will be created
resource "aws_security_group" "db-sg" {
  name        = "db-sg"
  description = "Security group for the Database Instance"

  #PostgreSQL Server
  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    cidr_blocks = ["${var.vpc_cidr}"]
  }

  # inbound ssh traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_cidr}"]
  }

  
  # outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${aws_vpc.rafmme_vpc.id}"

  tags = {
    Name = "db_server_security_group"
  }
}


# the security group for the NAT Instance and Bastion host that will be created
resource "aws_security_group" "bastion-nat-sg" {
  name        = "bastion-nat-sg"
  description = "Security group for the Bastion Host & NAT Instance"

  #PostgreSQL Server
  # inbound traffic
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${aws_vpc.rafmme_vpc.id}"

  tags = {
    Name = "bastion_nat_security_group"
  }
}


# the security group for the API Instance that will be created
resource "aws_security_group" "api-backend-sg" {
  name        = "api-backend-sg"
  description = "Security group for the API Server Instance"

  # inbound traffic
  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks = ["${var.vpc_cidr}"]
  }

  # outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${aws_vpc.rafmme_vpc.id}"

  tags = {
    Name = "api_server_security_group"
  }
}
