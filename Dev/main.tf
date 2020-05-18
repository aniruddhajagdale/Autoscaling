module "tf-elb" {
  source = "C:\\Terraform Lab\\AutoScaling\\ELB"
}

module "tf-asg" {
  source = "C:\\Terraform Lab\\AutoScaling\\ASGroup"
  elb-name = "${module.tf-elb.elb-name}"
}

