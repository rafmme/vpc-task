data "aws_ami" "nat-ami-image" {
  executable_users = ["self"]
  owners           = ["099720109477"]

  filter {
    name = "name"
    values = ["amzn-ami-vpc-nat-hvm-*"]
  }

  filter {
    name = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "bastion-ami-image" {
  executable_users = ["self"]
  owners           = ["099720109477"]

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}


data "aws_ami" "frontend-image" {
  owners = ["self"]

  filter {
    name   = "name"
    values = ["${var.frontend_ami_name}"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "api-backend-image" {
  owners = ["self"]

  filter {
    name   = "name"
    values = ["${var.api_backend_ami_name}"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "db-image" {
  owners = ["self"]

  filter {
    name   = "name"
    values = ["${var.db_ami_name}"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
