# It will fetch all the availability zones in the region ec2 is created
data "aws_availability_zones" "available" { }

# It will fetch the ami for the ubuntu machines for the owner = 099720109477
# and apply the both the filter
data "aws_ami" "latest-ubuntu" {
  most_recent = true
  owners = ["099720109477"]

  filter {
	name = "name"
	values =["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
	name = "virtualization-type"
	values = ["hvm"]
  }
}

resource "aws_instance" "MyFirstInstance" {
	ami = data.aws_ami.latest-ubuntu.id #lookup(var.AMIS, var.AWS_REGION) #"ami-05803413c51f242b7"
	instance_type = "t2.micro"
	availability_zone = data.aws_availability_zones.available.names[0]

	provisioner "local-exec" {
	  command = "echo aws_instance.MyFirstInstance.private_ip >> my_private_ips.txt"
	}

	tags = {
		Name = "custom_instance"
	}
	# security_groups = var.Security_Group #"${var.Security_Group}"
}

output "public_ip" {
	value = aws_instance.MyFirstInstance.public_ip
}