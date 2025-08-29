resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "tf-vpc"
  }
}

output "vpc_id" {
  value = aws_vpc.this.id
}
