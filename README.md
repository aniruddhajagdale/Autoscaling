# Autoscaling
This repository contains terraform configuration for building auto scaling group. The auto scaling group is attached to a classic ELB and has 2 instances attached to it. Prerequisites for here mentioned ASG are classic ELB and launch configuration. Steps are as follows:

1. Build classic ELB.
2. Build launch configuration.
3. Build auto scaling group.

The whole set up is by means of modules.
