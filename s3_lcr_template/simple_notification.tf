# resource "aws_sns_topic" "my-email-notification" {
#   name            = "my-email-notification"
#   delivery_policy = <<EOF
# {
# 	"Version": "2012-10-17",
# 	"Id": "AllowS3Publish",
# 	"Statement": [{
# 		"Sid": "S3EventNotification",
# 		"Effect": "Allow",
# 		"Principal": {
# 			"Service": "s3.amazonaws.com"
# 		},
# 		"Action": [
# 			"SNS:Publish"
# 		],
# 		"Resource": "arn:aws:sns:us-east-1:312498729563:my-email-notification",
# 		"Condition": {
# 			"ArnLike": {
# 				"aws:SourceArn": "arn:aws:s3:::playground-bucket-01"
# 			},
# 			"StringEquals": {
# 				"aws:SourceAccount": "312498729563"
# 			}
# 		}
# 	}]
# }
# EOF
# }

# resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
#   topic_arn = aws_sns_topic.my-email-notification.arn
#   protocol  = "email"
#   endpoint  = "antymijaljevic@gmail.com"
# }

