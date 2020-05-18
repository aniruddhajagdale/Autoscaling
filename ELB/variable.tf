variable "region" {
  default = "ap-south-1"
}
variable "elb-bucket" {
  default = "s3-aniruddha"
}
variable "elb-bucket-prefix" {
  default = "ELBLogs"
}
data "aws_security_groups" "sgs" {
  filter {
    name   = "vpc-id"
    values = ["vpc-fb313b93"]
  }

}

data "aws_availability_zones" "az-names" {}

