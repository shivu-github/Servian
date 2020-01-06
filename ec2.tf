provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
}

# Create EC2 instance
resource "aws_instance" "servian-ec35" {
  ami                    = "ami-0dacb0c129b49f529"
  instance_type          = "t2.micro"
  key_name               = "shivu-key"
  vpc_security_group_ids = ["${aws_security_group.servian-sg35.id}"]
  user_data = <<EOF
                #!/bin/bash
                sudo yum update -y
                sudo yum install docker -y 
                sudo service docker start
                sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                sudo chmod +x /usr/local/bin/docker-compose
  EOF
  tags = {
          Name = "servian-ec35"
         }
}

resource "aws_security_group" "servian-sg35" {
  name = "servian-sg35"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 5000
    to_port     = 5000
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
