# creates a load balancer for accesing the front-end instance
resource "aws_lb" "frontend_lb" {
  name = "frontend-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = ["${aws_subnet.rafmme_public_subnet.id}"]
  security_groups    = ["${aws_security_group.bastion-nat-sg.id}"]
  
  tags {
    Name = "frontend-lb"
  }
}


resource "aws_lb_target_group" "frontend_tg" {
  name     = "frontend-tg"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.rafmme_vpc.id}"
}


resource "aws_lb_listener" "frontend_lb_listener" {
  load_balancer_arn = "${aws_lb.frontend_lb.arn}"
  port              = "80"
  protocol          = "HTTP"
  default_action {
    target_group_arn = "${aws_lb_target_group.frontend_tg.arn}"
    type             = "forward"
  }
}


resource "aws_lb_target_group_attachment" "frontend_attachment" {
  target_group_arn = "${aws_lb_target_group.frontend_tg.arn}"
  target_id        = "${aws_instance.frontend.id}"
  port             = "80"
}
