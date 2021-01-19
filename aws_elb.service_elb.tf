resource "aws_elb" "service_elb" {
  #checkov:skip=CKV_AWS_92: "Ensure the ELB has access logging enabled"
  subnets         = var.public_subnets
  security_groups = [aws_security_group.elb.id]
  instances       = [aws_instance.teamcity.id]

  dynamic "listener" {
    for_each = var.listeners

    content {
      instance_port      = listener.value["instance_port"]
      instance_protocol  = listener.value["instance_protocol"]
      lb_port            = listener.value["lb_port"]
      lb_protocol        = listener.value["lb_protocol"]
      ssl_certificate_id = listener.value["ssl_certificate_id"]
    }
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:8111"
    interval            = 30
  }

  tags = var.common_tags
}
