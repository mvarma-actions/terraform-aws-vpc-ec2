# terraform-aws-vpc-ec2

This Terraform project provisions a complete VPC and EC2 in AWS including:

- A VPC with CIDR block `10.0.0.0/16`
- 3 public subnets and 3 private subnets across multiple Availability Zones
- Internet Gateway and route tables for internet access in public subnets
- An EC2 instance provisioned in a public subnet
- HTTP (port 80) access to the EC2 instance by its public IP

## Region
All resources are deployed in the `us-east-2` region by default.

## Modules

- `vpc` – Creates the VPC
- `subnets` – Provisions 3 public and 3 private subnets
- `internet_gateway` – Attaches an IGW to the VPC
- `route_tables` – Associates public/private route tables with subnets
- `ec2` – Launches a public EC2 instance with access on port 80

## Usage

Initialize and apply the Terraform configuration:

```bash
terraform init
terraform apply
```
