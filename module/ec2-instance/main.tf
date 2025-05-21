data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "web_server_sg_tf" {
  name        = "${var.name_tag}-sg-${terraform.workspace}"
  description = "Allow HTTP and SSH to web server"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "HTTP ingress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_vm" {
  ami           = "ami-084568db4383264d4"
  instance_type = local.instance_type

  tags = {
    Name = local.name_tag
    Env  = local.environment
  }

  vpc_security_group_ids = [aws_security_group.web_server_sg_tf.id]
}
