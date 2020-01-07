provider "aws" {
  region="us-east-2"
  shared_credentials_file = "./credentials"
  profile = "shivu-servian"
}

# Create EC2 instance
resource "aws_instance" "servian-ec2" {
  ami                    = "ami-06d0f8680277569ce"
  instance_type          = "t2.micro"
  key_name               = "servian"
  vpc_security_group_ids = ["${aws_security_group.servian-sg.id}"]
  
  tags = {
          Name = "servian-ec2"
         }
}

resource "aws_security_group" "servian-sg" {
  name = "servian-sg"

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
