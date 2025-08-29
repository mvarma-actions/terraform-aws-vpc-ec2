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

## Prerequisites

Before running this Terraform project, ensure the following are set up on your local machine:

### 1. Install Terraform

1. Download Terraform from the official website:

   https://developer.hashicorp.com/terraform/downloads

2. After installation, verify it using:

   ```bash
   terraform -version
   ```

### 2. Configure AWS Credentials

Terraform needs AWS credentials to provision resources. You can configure them in one of the following ways:

#### Option A: Using AWS CLI (Recommended)

1. Install the AWS CLI: 
    
   https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html

2. Run the following command:

   ```bash
   aws configure
   ```

3. Enter your credentials when prompted:
    
   ```pgsql
   AWS Access Key ID:       <your-access-key-id>
   AWS Secret Access Key:   <your-secret-access-key>
   Default region name:     us-east-2
   Default output format:   json (or leave blank)
   ```

#### Option B: Using Environment Variables

Alternatively, export your credentials directly in your terminal session:

```bash
export AWS_ACCESS_KEY_ID=your-access-key-id
export AWS_SECRET_ACCESS_KEY=your-secret-access-key
export AWS_DEFAULT_REGION=us-east-2
```

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
