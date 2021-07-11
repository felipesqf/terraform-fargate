output "intra_subnets" {
value = [aws_subnet.secure_subnet[0].id, aws_subnet.secure_subnet[1].id]
}

output "private_subnets" {
  value = [aws_subnet.private_subnet[0].id, aws_subnet.private_subnet[1].id]
}

output "public_subnets" {
  value = [aws_subnet.public_subnet[0].id, aws_subnet.public_subnet[1].id]
}

output "vpc" {
  value = aws_vpc.wpvpc.id
}
