# local_file resource details:
#    Resource name = "my-pet"
#    File name = "/root/pet-name"
#    Content = "My pet is called finnegan!!"


# random_pet resource details:
#    Resource name = "other-pet"
#    Length = "1"
#    Prefix = "Mr"
#    Separator = "."


resource "local_file" "my-pet" {
    filename = "/root/pet-name"
    content = "My pet is called finnegan!!"
}
resource "random_pet" "other-pet" {
    length = "1"
    prefix = "Mr"
    separator = "."
}
