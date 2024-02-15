
resource "local_file" "cloud" {
	   filename = "/tmp/plugins"
	   content = "multiple cloud providers."

}

resource "aws_ebs_volume" "myvolume" {
  availability_zone = "us-east-2"
  size              = 20
}
