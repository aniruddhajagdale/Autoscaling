provider "aws" {
  profile = "default"
  region  = "${var.region}"
}

resource "aws_elb" "c-elb" {
  name               = "classicELB"
  availability_zones = "${data.aws_availability_zones.az-names.names}"
  security_groups    = ["${data.aws_security_groups.sgs.ids[0]}"]
  access_logs {
    bucket        = "${var.elb-bucket}"
    bucket_prefix = "${var.elb-bucket-prefix}"
    interval      = 5
    enabled       = true
  }
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 2
    target              = "http:80/index.html"
    interval            = 30
    timeout             = 20
  }
  cross_zone_load_balancing = true

}
output "dns-url" {
  value = "${aws_elb.c-elb.dns_name}"
}

output "elb-name" {
  value = "${aws_elb.c-elb.name}"
}

