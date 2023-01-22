resource "aws_instance" "MyFirstInstance" {
	ami = lookup(var.AMIS, var.AWS_REGION) #"ami-05803413c51f242b7"
	instance_type = "t2.micro"

	tags = {
		Name = "custom_instance"
	}
	# security_groups = var.Security_Group #"${var.Security_Group}"
}
