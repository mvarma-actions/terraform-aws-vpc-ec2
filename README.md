# terraform-aws-vpc-ec2

This Terraform project provisions a complete VPC environment and an EC2 instance with public HTTP access in AWS.

## What It Provisions

- A VPC with CIDR block `10.0.0.0/16`
- 3 public subnets and 3 private subnets across multiple Availability Zones
- An Internet Gateway (IGW) with proper route tables for public subnets
- A public EC2 instance reachable over HTTP (port 80) via its public IP

## Region

All resources are provisioned in the `us-east-2` (Ohio) region by default.

## Modules

This project uses custom modules (no third-party dependencies):

- `vpc` – Creates the VPC with required settings
- `subnets` – Creates 3 public and 3 private subnets in different AZs
- `internet_gateway` – Provisions and attaches an IGW to the VPC
- `route_tables` – Creates and associates route tables to enable internet access for public subnets
- `ec2` – Launches an Ubuntu EC2 instance in a public subnet with HTTP access

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/terraform-aws-vpc-ec2.git
   cd terraform-aws-vpc-ec2
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Review the execution plan:
   ```bash
   terraform plan
   ```

4. Apply the configuration:
   ```bash
   terraform apply
   ```
5. After the deployment, Terraform will output the public IP of the EC2 instance.  
   Visit the IP in your browser using **HTTP**, for example:
    ```bash
    http://<public-ip>
    ```
