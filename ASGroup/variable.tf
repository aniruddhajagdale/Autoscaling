variable "region" {
  default = "ap-south-1"
}
variable "elb-name" {
  default = ""
}

data "aws_availability_zones" "azs" {

}
data "aws_security_groups" "sg" {
  filter {
    name   = "vpc-id"
    values = ["vpc-fb313b93"]
  }
}

data "aws_ami" "instance-ami" {
  //executable_users = ["self"]
  //most_recent      = true
  owners = ["self"]
  //name_regex       = "amz-image*"

  filter {
    name   = "name"
    values = ["amz-image"]
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

