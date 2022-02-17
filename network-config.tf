resource "aws_vpc" "test-vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true" 
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    instance_tenancy = "default"    

}
resource "aws_subnet" "test-subnet-public-1" {
    vpc_id = "${aws_vpc.test-vpc.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-2a"
}
resource "aws_subnet" "test-subnet-public-2" {
    vpc_id = "${aws_vpc.test-vpc.id}"
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-2b"
}
resource "aws_subnet" "test-subnet-private-1" {
    vpc_id = "${aws_vpc.test-vpc.id}"
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-2c"
}
#resource "aws_subnet" "test-subnet-private-2" {
#    vpc_id = "${aws_vpc.test-vpc.id}"
#    cidr_block = "10.0.4.0/24"
#    map_public_ip_on_launch = "false"
#    availability_zone = "us-east-2d"
#}

resource "aws_internet_gateway" "test-igw" {
    vpc_id = "${aws_vpc.test-vpc.id}"
}

resource "aws_route_table" "public-connect" {
    vpc_id = "${aws_vpc.test-vpc.id}"
    
    route {
        cidr_block = "0.0.0.0/0" 
        gateway_id = "${aws_internet_gateway.test-igw.id}" 
    }
}
resource "aws_nat_gateway" "sierra-nat" {
  connectivity_type = "private"
  subnet_id     = aws_subnet.test-subnet-public-2.id
  depends_on = [aws_internet_gateway.test-igw]
}
