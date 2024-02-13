#Resource file used to crate an AWS S3 bucket

resource "aws_s3_bucket" "data" {
    bucket = "webserver-bucket-org-2207"
    acl    = "private"
}
