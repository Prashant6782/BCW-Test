<<<<<<< HEAD
resource "aws_instance" "sierra-test1" {
ami = "ami-0b614a5d911900a9b"
=======
resource "aws_instance" "sierra-5007" {
ami = "ami-13be557e"
>>>>>>> 2d4c9c03d7405998ad64c800249394da10a38cf6
instance_type = "t2.micro"
subnet_id = "${aws_subnet.test-subnet-private-1.id}"
}
