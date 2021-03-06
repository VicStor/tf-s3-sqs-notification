resource "aws_sqs_queue" "queue" {
  name   = "s3-content-queue"
}

resource "aws_sqs_queue_policy" "sqs_policy" {
  queue_url = aws_sqs_queue.queue.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "${aws_sqs_queue.queue.arn}",
      "Condition": {
        "ArnEquals": { "aws:SourceArn": "${aws_s3_bucket.file_container.arn}" }
      }
    }
  ]
}
POLICY
}