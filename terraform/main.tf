
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "public_access_server" {
  ami             = "ami-042e8287309f5df03" //Ubuntu AMI
  instance_type   = "m5.4xlarge"
  key_name        = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_from_my_ip.id, var.default_vpc_security_group_id]
  subnet_id       = var.public_subnet_id
  associate_public_ip_address = "true"
  tags = {
    Name = "jmeter_sever_public_access"
  }
}

resource "aws_instance" "jmeter_sever_clients_api" {
  count           = var.instance_count_6
  ami             = "ami-042e8287309f5df03"  //Ubuntu AMI
  instance_type   = "c5.9xlarge"
  key_name        = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_from_my_ip.id, var.default_vpc_security_group_id, var.other_security_group_id]
  subnet_id       = var.private_subnet_id_us_east_1a
  
  tags = {
    Name = "jmeter_sever_client_APIs_${count.index}"
  }
}

resource "aws_security_group" "allow_from_my_ip" {
  name              = "allow-from-my-ip-address-only"
  description       = "allow access to SSH port 22 from my ip address"
  vpc_id            = var.vpc_id
  ingress {
    description     = "Allow port 22"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = var.cidr_blocks
  }
  egress {
    from_port       =  0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}