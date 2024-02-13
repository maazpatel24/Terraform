#local_file.pet will be created

resource "local_file" "pet" {
  filename = "/home/einfochips/Desktop/OneDrive/Terraform/tt/pets.txt"
  content = "We love pets!"
}
