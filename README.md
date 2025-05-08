IaC Pipeline with GitHub #test This repository contains the code and configuration for automating infrastructure provisioning using Terraform and GitHub actions.

Overview

This Infrastructure as Code (IaC) pipeline automates the provisioning and management of infrastructure resources on AWS. The pipeline is triggered automatically on each push to the repository.

Folder structure

.github/workflows: Github Actions workflow files
.github/plan: Composite workflow for terraform plan
.github/apply: Composite workflow for terraform apply
terraform: Terraform configuration files
This shows the process how pipeline for Terraform deployment works.

The main branch holds the state of all currently deployed Terraform. Whenever Engineers push the code from a branch called feature/<> with changes they want to make, pipeline will create Auto pull request. After PR created, a pipeline automatically picks up these changes, runs a terraform plan. Important: We want to ensure the above plan is exactly what we apply in later steps. The plan is saved as a file and uploaded as a GitHub artifact. Eventually, reviewer approves the PR. This kicks off terraform apply pipeline to apply the previously reviewed plan.

Prerequisites

For creating Auto Pull request, please create a token and give it as value for the secret TOCKEN_GIT.
Mention "WIP" in commit messages for Work In Progress Pull requests. Test
