
# VPC
resource "aws_vpc" "wpvpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

# PUBLIC SUBNET

resource "aws_subnet" "public_subnet" {
  count = var.number_resources
  vpc_id            = "${aws_vpc.wpvpc.id}"
  availability_zone = "${var.availability_zone["${count.index}"]}"
  cidr_block        = "${var.public_cidr[count.index]}"
  map_public_ip_on_launch = true

  tags = {
    Name        = "wp_public_subnet"
  }
}

# PRIVATE SUBNET

resource "aws_subnet" "private_subnet" {
  count = var.number_resources
  vpc_id            = "${aws_vpc.wpvpc.id}"
  availability_zone = "${var.availability_zone["${count.index}"]}"
  cidr_block        = "${var.private_cidr["${count.index}"]}"

  tags = {
    Name        = "wp_private_subnet"
  }
}

# SECURE SUBNET 

resource "aws_subnet" "secure_subnet" {
  count = var.number_resources
  vpc_id            = "${aws_vpc.wpvpc.id}"
  availability_zone = "${var.availability_zone["${count.index}"]}"
  cidr_block        = "${var.secure_cidr["${count.index}"]}"

  tags = {
    Name        = "wp_secure_subnet"
  }
}

# INTERNET GATEWAY

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.wpvpc.id}"

  tags = {
    Name        = "Igw-final-Challenge"
  }
}

#  ROUTE TABLE
resource "aws_route_table" "public_route" {
  vpc_id = "${aws_vpc.wpvpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name        = "PR-final-Challenge"
  }
}

resource "aws_route_table" "nat_route" {
  count = var.number_resources
  vpc_id = "${aws_vpc.wpvpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.natgw["${count.index}"].id}"
  }
  tags = {
    Name        = "NatRoute-0"
  }
}

# ROUTE TABLE ASSOCIATION

resource "aws_route_table_association" "route-pub" {
  count = var.number_resources
  subnet_id      = "${aws_subnet.public_subnet["${count.index}"].id}"
  route_table_id = "${aws_route_table.public_route.id}"
}

resource "aws_route_table_association" "route-priv" {
  count = var.number_resources
  subnet_id      = "${aws_subnet.private_subnet["${count.index}"].id}"
  route_table_id = "${aws_route_table.nat_route["${count.index}"].id}"
}

resource "aws_route_table_association" "route-sec" {
  count = var.number_resources
  subnet_id      = aws_subnet.secure_subnet[count.index].id
  route_table_id = "${aws_route_table.nat_route["${count.index}"].id}"

}

# NAT GATEWAY

resource "aws_nat_gateway" "natgw" {
  count = var.number_resources
  allocation_id = "${aws_eip.nat_pub["${count.index}"].id}"
  subnet_id     = "${aws_subnet.public_subnet["${count.index}"].id}"

  tags = {
    Name = "NATGTW-PubSub"
  }
}

resource "aws_eip" "nat_pub" {
  count = var.number_resources
  vpc = true
}



