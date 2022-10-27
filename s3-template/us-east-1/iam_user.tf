resource "aws_iam_user" "paul" {
  name = "paul"
  path = "/paul/"
  tags = {
    Name = "Paul"
  }
}

resource "aws_iam_user_policy" "paul-policy" {
  name = "paul-s3-policy"
  user = aws_iam_user.paul.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "AllowGroupToSeeBucketListAndAlsoAllowGetBucketLocationRequiredForListBucket",
        "Action" : ["s3:ListAllMyBuckets", "s3:GetBucketLocation"], # List buckets
        "Effect" : "Allow",
        "Resource" : ["arn:aws:s3:::*"]
      },
      {
        "Sid" : "AllowRootLevelListingOfCompanyBucket", # see bucket and files on tip level
        "Action" : ["s3:ListBucket"],
        "Effect" : "Allow",
        "Resource" : ["arn:aws:s3:::playground-bucket-01"],
        "Condition" : {
          "StringEquals" : { "s3:prefix" : [""], "s3:delimiter" : ["/"] }
        }
      },
      {
        "Sid" : "AllowListBucketIfSpecificPrefixIsIncludedInRequest",
        "Action" : [
          "s3:ListBucket"
        ],
        "Effect" : "Allow",
        "Resource" : [
          "arn:aws:s3:::playground-bucket-01" # only allow list files in Department folder
        ],
        "Condition" : {
          "StringLike" : {
            "s3:prefix" : [
              "Department/*"
            ]
          }
        }
      },
      {
        "Sid" : "AllowUserToReadWriteObjectDataInDepartmentFolder",
        "Action" : [
          "s3:GetObject",
          "s3:PutObject"
        ],
        "Effect" : "Allow",
        "Resource" : [
          "arn:aws:s3:::playground-bucket-01/Department/*"
        ]
      }
    ]
  })
}
