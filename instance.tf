provider "aws" {
  region  = "ap-south-1"
  access_key=""
  secret_key=""
  
}

resource "aws_instance" "my-machine" {
  ami           = "ami-0d81306eddc614a45"
  instance_type = "t2.micro"
  security_groups=["launch-wizard-2"]
  associate_public_ip_address = true
  key_name = "searchheadkey"
  count = 6

  tags = {
    Name = "my-machine-${count.index}"
    Environment = "Splunk-${count.index}"
    OS = "Linux"
  }

  }
