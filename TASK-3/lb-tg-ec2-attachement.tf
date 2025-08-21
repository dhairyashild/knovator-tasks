############         aws_lb            ############

resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_tls.id]
  subnets            = [aws_subnet.project-pub-sub-1.id, aws_subnet.project-pub-sub-2.id]


  tags = {
    Name = "interview-alb"
  }
}


##########   Instance Target Group  ############

resource "aws_lb_target_group" "test" {
  name     = "interview-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.project.id
}

###########    aws_lb_target_group_attachment       #########  tg & ec2  attached here

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = "i-0a4494bbf9a2e631b"
  port             = 80
}

##########     aws_lb_listener     ##################   lb  & tg attached in listener resource like below

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"                             # replaced 443 to 80
  protocol          = "HTTP"                           # replaced HTTPS TO HTTP

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}