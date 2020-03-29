resource "aws_s3_bucket" "file_container" {
  bucket = var.file_container_name
}
