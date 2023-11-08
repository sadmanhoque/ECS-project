#Setting up the IAM policy and user group first
resource "aws_iam_group_policy" "policy" {
  name        = "AllowPushPullPolicy"
  //path        = "/"
  //description = "Enables CICD pipeline to pull/pull ECR images"
  group = aws_iam_group.deployers.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid": "GetAuthorizationToken",
        "Effect": "Allow",
        "Action": [
          "ecr:GetAuthorizationToken"
        ],
        "Resource": "*"
      },
      {
        "Effect": "Allow",
        "Action": [
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ],
        "Resource": [
          "*"
        ]
      }
    ]
  })
}

resource "aws_iam_group" "deployers" {
  name = "deployers"
  path = "/users/"
}

#The manual parts of the pipeline:
/*

-Adding ECS access policy to the deployer user group.

-Creating Github-actions user, adding that to the deployer user group.

-Get the IAM access credentials for this user and add them to Github repo as secrets for github actions.

*/