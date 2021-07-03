resource "aws_vpc" "demo_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "training"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "training-pub-1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "training-pub-2"
  }
}


resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "training-pri-1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    Name = "training-pri-2"
  }
}



resource "aws_internet_gateway" "custom-igw" {
  vpc_id = aws_vpc.demo_vpc.id

  tags = {
    Name = "training-igw"
  }
}


resource "aws_route_table" "public_routing_table" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.custom-igw.id

  }
  tags = {
    Name = "training-public-route"
  }
}

resource "aws_route_table_association" "public_subnet-ass-1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_routing_table.id
}

resource "aws_route_table_association" "public_subnet-ass-2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_routing_table.id
}