provider "aws" {
  profile = "default"
  region  = "${var.region}"
}

resource "aws_launch_configuration" "ec2-launch-config" {
  name                 = "ec2-config"
  image_id             = "${data.aws_ami.instance-ami.image_id}"
  instance_type        = "t2.micro"
  iam_instance_profile = "s3-admin-access"
  key_name             = "EC2 Key"
  security_groups      = ["${data.aws_security_groups.sg.ids[0]}"]
  user_data            = file("C:\\Terraform Lab\\AutoScaling\\bashscript.sh")
}

resource "aws_autoscaling_group" "asg" {
  name                      = "EC2Fleet"
  max_size                  = 2
  min_size                  = 2
  availability_zones        = "${data.aws_availability_zones.azs.names}"
  launch_configuration      = "${aws_launch_configuration.ec2-launch-config.name}"
  health_check_grace_period = 150
  health_check_type         = "ELB"
  desired_capacity          = 2
  load_balancers            = ["${var.elb-name}"]

}

