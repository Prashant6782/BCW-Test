resource "aws_instance" "sierra-5007" {
ami = "ami-13be557e"
instance_type = "t2.micro"
subnet_id = "${aws_subnet.test-subnet-private-1.id}"
}
