resource "aws_vpc" "environment_example_aws" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "terraform_aws_vpc"
  }
}

resource "aws_subnet" "pub_us_east_2a" {
  cidr_block = "${cidrsubnet(aws_vpc.environment_example_aws.cidr_block,8, 1)}"
  vpc_id = "${aws_vpc.environment_example_aws.id}"
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "tf_pub_us_e_2a"
  }
}

resource "aws_subnet" "pri_us_east_2b" {
  cidr_block = "${cidrsubnet(aws_vpc.environment_example_aws.cidr_block,8, 2)}"
  vpc_id = "${aws_vpc.environment_example_aws.id}"
  availability_zone = "us-east-2b"
  map_public_ip_on_launch = false
  tags = {
    Name = "tf_pri_us_e_2b"
  }
}

resource "aws_security_group" "sub_sec_grp" {
  vpc_id = "${aws_vpc.environment_example_aws.id}"
  ingress {
    cidr_blocks = [
      "${aws_vpc.environment_example_aws.cidr_block}"
    ]
    from_port = 80
    protocol = "tcp"
    to_port = 80
  }
}