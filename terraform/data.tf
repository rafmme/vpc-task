# the data source for the AMI for the DB instance, filtered to give the ami we provisioned by the name given
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
