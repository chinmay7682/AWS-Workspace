resource "aws_vpc" "workspace" {
  cidr_block = "10.20.0.0/16"
}

resource "aws_subnet" "private1" {
  vpc_id               = aws_vpc.workspace.id
  availability_zone_id = "use1-az2"
  cidr_block           = "10.20.1.0/24"
}

resource "aws_subnet" "private2" {
  vpc_id               = aws_vpc.workspace.id
  availability_zone_id = "use1-az4"
  cidr_block           = "10.20.2.0/24"
}

resource "aws_subnet" "public1" {
  vpc_id               = aws_vpc.workspace.id
  availability_zone_id = "use1-az4"
  cidr_block           = "10.20.3.0/24"
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.workspace.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.workspace.id
  }

  tags = {
    Name = "private"
  }
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_eip" "workspace-nat" {
  vpc      = true
}

resource "aws_nat_gateway" "workspace" {
  allocation_id = aws_eip.workspace-nat.id
  subnet_id = aws_subnet.public1.id

  tags = {
    Name = "gw NAT"
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.workspace.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.workspace.id

  tags = {
    Name = "main"
  }
}