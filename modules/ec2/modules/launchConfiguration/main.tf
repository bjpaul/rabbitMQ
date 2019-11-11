resource "aws_launch_configuration" "lc" {
  name_prefix   = "tf-lc-rabbitMQ-"
  image_id      = var.ami-id
  instance_type = "t2.micro"

  iam_instance_profile = var.iam_inst_prof
  user_data = filebase64("${path.module}/cloud-config-lighter")
  associate_public_ip_address = true
  security_groups = [var.sg-id]
  
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg" {
  name                 = "rabbitMQ-ASG"
  launch_configuration = aws_launch_configuration.lc.name
  min_size             = 3
  max_size             = 3
  desired_capacity     = 3

  lifecycle {
    create_before_destroy = true
  }

  health_check_grace_period = 300
  health_check_type         = "EC2"
  vpc_zone_identifier       = var.subnet-id
  load_balancers            = [var.clb-name]
}