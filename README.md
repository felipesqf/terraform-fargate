# Terraform-Fargate-CLuster
Create VPC, Subnets and ECS Fargate Cluster

- VPC
- 2 Public Subnets, 2 Private Subnets and 2 Secure Subnets in different Availability Zones
- Route Table
- NAT Gateway
- Internet Gateway
- Route Table and Association

## Commands
 - terraform init
 - terraform plan
 - terraform apply


## Required Input
- region (string)
- availability_zone (list(string))
- vpc_cidr (string)
- secure_cidr (list(string))
- private_cidr (list(string))
- public_cidr (list(string))
- number_resources (number)