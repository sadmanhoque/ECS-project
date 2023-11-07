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

#IAM user for deploying now
/*resource "aws_iam_access_key" "lb" {
  user    = aws_iam_user.lb.name
  pgp_key = "keybase:some_person_that_exists"
}

resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"
}

data "aws_iam_policy_document" "lb_ro" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "lb_ro" {
  name   = "test"
  user   = aws_iam_user.lb.name
  policy = data.aws_iam_policy_document.lb_ro.json
}

output "secret" {
  value = aws_iam_access_key.lb.encrypted_secret
}*/
