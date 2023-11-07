### Intro ###

This script deploys a fully functional Fargate ECS cluster as well as all the required IAM and securitygroup setup and the ALB required to access the site. It is also setting up a new ECR repo where the docker image of the server needs to be uploaded, for the instructions on that just go to console and check the "vew push commands" option on the ECR repo that this script generates and follow that.

## Creation Commands ##
`Terraform init`
`Terraform plan`
`Terraform apply`

## Destruction Commands ##
`Terraform destroy`