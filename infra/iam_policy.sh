{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowDistributionInvalidation",
            "Effect": "Allow",
            "Action": "cloudfront:CreateInvalidation",
            "Resource": "YOURCLOUDFRONTARN"
        }
    ]
}
