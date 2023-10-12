# Create a VPC
resource "aws_vpc" "example" {
    cidr_block = "10.1.0.0/16"
}

# Create an internet gateway
resource "aws_internet_gateway" "example" {
    vpc_id = aws_vpc.example.id
}

# Create a route table
resource "aws_route_table" "example" {
    vpc_id = aws_vpc.example.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.example.id
    }
}

# Associate the route table with the VPC's main subnet
resource "aws_route_table_association" "example" {
    subnet_id      = aws_subnet.example.id
    route_table_id = aws_route_table.example.id
}

# Create a subnet
resource "aws_subnet" "example" {
    vpc_id     = aws_vpc.example.id
    cidr_block = "10.1.1.0/24"
}
