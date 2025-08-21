resource "aws_subnet" "project-pub-sub-1" {
  vpc_id     = aws_vpc.project.id
  cidr_block = "10.0.1.0/24"
map_public_ip_on_launch = true
  tags = {
    Name = "project-pub-sub-1"
  }
}

resource "aws_subnet" "project-pub-sub-2" {
  vpc_id     = aws_vpc.project.id
  cidr_block = "10.0.5.0/24"
map_public_ip_on_launch = true
availability_zone = "ap-south-1a"
  tags = {
    Name = "project-pub-sub-2"
  }
}

resource "aws_route_table_association" "t" {
  subnet_id      = aws_subnet.project-pub-sub-2.id
  route_table_id = aws_route_table.project-pub-rt.id
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.project.id

  tags = {
    Name = "project-igw"
  }
}

resource "aws_route_table" "project-pub-rt" {
  vpc_id = aws_vpc.project.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

 
  tags = {
    Name = "project-pub-rt"
  }
}


resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.project-pub-sub-1.id
  route_table_id = aws_route_table.project-pub-rt.id
}

