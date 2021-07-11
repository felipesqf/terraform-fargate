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
- region 
    type = string
- availability_zone 
    type = list(string)
- vpc_cidr
    type = string
-secure_cidr
    type = list(string)
-private_cidr
    type = list(string)
-public_cidr
    type = list(string)
-number_resources
    type = number