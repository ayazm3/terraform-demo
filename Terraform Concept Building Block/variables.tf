variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
default = "us-east-2"
}

variable "Security_Group" {
	type = list
	default = ["sg-24076","sg-456789","sg-90890"]
}

variable "AMIS" {
	type = map
	default = {
		us-east-1 = "ami-0b0ea68c435eb488d"
		us-east-2 = "ami-05803413c51f242b7"
		us-west-1 = "ami-0454207e5367abf01"
		us-west-2 = "ami-0688ba7eeeeefe3cd"
	}
}