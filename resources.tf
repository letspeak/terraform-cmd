resource "aws_vpc" "environment_example_aws" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "terraform_aws_vpc"
  }
}