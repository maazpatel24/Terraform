#local_file.pet will be created

resource "local_file" "pet" {
  filename = "/home/einfochips/Desktop/OneDrive/Terraform/HCL-Basics/pets.txt"
  content = "We love pets!"
}
