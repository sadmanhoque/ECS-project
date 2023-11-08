# Intro

This is dir is for a terraform script that deploys the required resources needed for the CICD pipeline to work. The pipeline itself is for a different repo, not this one, but these resources can be used for any repo.

## Resources not deployed by the script and need to be done manually

* *Adding ECS access policy to the deployer user group.

* *Creating Github-actions user, adding that to the deployer user group.

* *Get the IAM access credentials for this user and add them to Github repo as secrets for github actions.