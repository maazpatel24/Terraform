#resource file created for provisioning an AWS ec2 instace

resource "aws_instance" "webserver" {
   ami = "ami-0c2f25c1f66a1ff4d"
   instance_type = "t2.micro"
}
