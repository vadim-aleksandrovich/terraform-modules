
resource "aws_security_group" "webserver" {
  name        = "Web Server SG for VPC: ${var.sg_name}"
  description = "Security Group for VPC: ${var.vpc_id}"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.allow_ports_webserver
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "ingress" {
    for_each = var.allow_ports_secure
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.vpc_cidr_secure]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = var.sg_name
  }

}
