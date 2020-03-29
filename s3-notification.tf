resource "aws_s3_bucket_notification" "s3_notification" {
  bucket = aws_s3_bucket.file_container.id

  queue {
    queue_arn = aws_sqs_queue.queue.arn
    events    = ["s3:ObjectCreated:*"]
  }
}
