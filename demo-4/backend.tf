terraform {
  backend "s3" {
    bucket = "terraform-course-tfstate-lyw"
    key    = "terraform/demo4"
    region = "ap-southeast-1"
  }
}
