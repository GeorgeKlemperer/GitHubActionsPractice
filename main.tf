provider "aws" {
  region = "eu-west-2"  # Replace with your desired region
}

resource "aws_instance" "example" {
  ami           = "ami-001c1821bbfc6dfd5"  # Replace with your desired AMI ID
  instance_type = "t2.micro"  # Replace with your desired instance type

  tags = {
    Name = "HelloWorldInstance"
  }

  user_data = <<-EOF
    #!/bin/bash
    echo "Hello, World" > /var/www/html/index.html
    nohup python -m SimpleHTTPServer 80 &
    EOF
}
