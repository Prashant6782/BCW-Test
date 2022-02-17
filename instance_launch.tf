resource "aws_instance" "sierra-test1" {
ami = "ami-0b614a5d911900a9b"
instance_type = "t2.micro"
subnet_id = "${aws_subnet.test-subnet-private-1.id}"
}
