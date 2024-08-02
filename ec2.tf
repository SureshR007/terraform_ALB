resource "aws_instance" "web" {
  count         = var.instance_count
  ami           = "ami-0ba9883b710b05ac6"
  instance_type = var.instance_type
  subnet_id     = element(aws_subnet.public[*].id, count.index)
  associate_public_ip_address = true
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "This is from $(hostname -f)" > /var/www/html/index.html
              EOF
  tags = {
    Name = "WebServer-${count.index + 1}"
  }
  security_groups    = [aws_security_group.web_sg.id]
} 