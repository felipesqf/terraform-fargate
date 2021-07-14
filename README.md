# Terraform-Fargate-Cluster
Create VPC, Subnets and ECS Fargate Cluster

- VPC
- 2 Public Subnets, 2 Private Subnets and 2 Secure Subnets in different Availability Zones
- Route Table
- NAT Gateway
- Internet Gateway
- Route Table and Association
- ECS Cluster (Fargate)

## Required Input
- region (string)
- availability_zone (list(string))
- vpc_name (string)
- vpc_cidr (string)
- secure_cidr (list(string))
- private_cidr (list(string))
- public_cidr (list(string))
- number_resources (number)

## Commands
 - terraform init
 - terraform plan
 - terraform apply


