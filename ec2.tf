provider "aws" {
  region="us-east-2"
  shared_credentials_file = "./credentials"
  profile = "shivu-servian"
}

# Create EC2 instance
resource "aws_instance" "servian-ec2-new" {
  ami                    = "ami-0dacb0c129b49f529"
  instance_type          = "t2.micro"
  key_name               = "servian"
  vpc_security_group_ids = ["${aws_security_group.servian-sg-new.id}"]
  
  user_data = <<EOF
                #!/bin/bash
                sudo service docker start
                sudo service sshd restart 
                
  EOF

  tags = {
          Name = "servian-ec2-new"
         }
}

resource "aws_security_group" "servian-sg-new" {
  name = "servian-sg-new"

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


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
