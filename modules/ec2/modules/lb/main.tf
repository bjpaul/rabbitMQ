################
# loadbalancer #
################

resource "aws_elb" "lb" {
  name = "tf-lb-rabbitMQ"
  
  security_groups    = [var.sg-id]
  subnets            = var.subnet-id
  internal           = true

  listener {
    instance_port     = 15672
    instance_protocol = "TCP"
    lb_port           = 15672
    lb_protocol       = "TCP"
  }

  listener {
    instance_port      = 5672
    instance_protocol  = "TCP"
    lb_port            = 5672
    lb_protocol        = "TCP"
  }

  health_check {
    healthy_threshold   = 10
    unhealthy_threshold = 10
    timeout             = 10
    target              = "TCP:15672"
    interval            = 30
  }
}