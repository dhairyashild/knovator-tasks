resource "aws_subnet" "pvt-sub-1" {
  vpc_id     = aws_vpc.project.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "project-pvt-sub-1"
  }
}


resource "aws_subnet" "pvt-sub-2" {
  vpc_id     = aws_vpc.project.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "project-pvt-sub-2"
  }
}


resource "aws_route_table" "rt-pvt" {
  vpc_id = aws_vpc.project.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.example.id
  }

  tags = {
    Name = "pvt-rt-project"
  }
}


resource "aws_eip" "lb" {
  domain   = "vpc"
}


resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.project-pub-sub-1.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
 depends_on = [aws_internet_gateway.gw]
}