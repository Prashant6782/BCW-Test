resource "aws_instance" "bcw-test" {
ami = var.AMIS[var.AWS_REGION]
instance_type = "t2.micro"
subnet_id = "${aws_subnet.test-subnet-private-1.id}"
}
