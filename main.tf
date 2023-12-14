resource "aws_instance" "web" {
  ami             = "ami-06dd92ecc74fdfb36"
  instance_type   = "t2.micro"
  vpc_security_group_ids = [aws_security_group.test_test_test.id]
  #vpc_security_group_ids -> security_group   
  key_name = "kali_main_rsa_aws"


  tags = {
    Name = "helloWorld"
  }
}



resource "aws_security_group" "test_test_test" {
  name        = "new_group"
  description = "LOLOLO"
  vpc_id      = "vpc-060de73c8ae831086"

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "test_test_test"
  }
}