# Intro

This repo contains 3 Terraform script files and one basic node project file for experimenting deployments.

## Quick information on each project

### CICD-Deployer

Deploys most of the resources needed for the CICD pipeline for the server that ECS-deployer project can host.

### ECR-repo-deployer

Not actually necessary for deploying the project, good for testing the terraform and aws cli configuration.

### ECS-deployer

This is the main terraform script for deploying a docker image based application to ECS.

### sample-node-project

The name is very self explanatory, this can be used for quickly testing the services deployed by the ECS-deployer. However, to test the pipeline tools deployed by CICD-deployer, this would need to be in another repo, which also exists, I made this for testing. The other repo is: https://github.com/sadmanhoque/sample-node-project.
