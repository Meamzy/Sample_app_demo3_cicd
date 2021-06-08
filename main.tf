terraform {
  backend "remote" {
    organization = "Mea_corp"
    workspaces {
      name = "cicdworkspace"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}


provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.INSTANCE_SSH_PUBLIC_KEY
}


resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.app_server.id
  allocation_id = var.alloc_id
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

#   user_data = <<EOT
# #!/bin/bash
# sudo curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
# sudo docker login --username meamzy --password ~7MSim-yutv#6E7
# sudo docker run -p 2000:2000 -d meamzy/meazmysampleappcicd:latest
# EOT
  key_name  = aws_key_pair.deployer.key_name
  tags = {
    Name = var.instance_name
  }
}
