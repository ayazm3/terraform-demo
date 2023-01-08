resource "aws_instance" "MyFirstInstance" {
	ami = "ami-05803413c51f242b7"
	instance_type = "t2.micro"
	tags = {
		Name = "demoinstance"
	}
	Security_Group = "${var.Security_Group}"
}