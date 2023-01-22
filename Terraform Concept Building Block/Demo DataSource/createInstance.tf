# It will fetch all the availability zones in the region ec2 is created
data "aws_availability_zones" "available" {
  
}

resource "aws_instance" "MyFirstInstance" {
	ami = lookup(var.AMIS, var.AWS_REGION) #"ami-05803413c51f242b7"
	instance_type = "t2.micro"
	availability_zone = data.aws_availability_zones.available.names[0]
	
	tags = {
		Name = "custom_instance"
	}
	# security_groups = var.Security_Group #"${var.Security_Group}"
}
