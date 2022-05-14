# sample_github_actions_ecs_rollback
GitHub Actions sample which deploys ECS task of an arbitrary version instead of the current state of the repository.

## What does this repository contain
This repository has a tiny container application in `code` and some scripts/templates for CloudFormation in `infra`. They are supposed to be deployed on AWS (ECS task, ECR repository).

The main content is [.github/workflows/deploy.yml](https://github.com/sankaku/sample_github_actions_ecs_rollback/blob/main/.github/workflows/deploy.yml).  
It deploys the application and the infrastructures when Git tag like `v1.1`  is set. And if you want to rollback to an older version like `v1.0`, all you need is to re-run the GitHub Actions for `v1.0`.

## Preparation
(A lot of detailed explanations are omitted.)

- ECS Execution Role  
  Save the ARN of this role to GitHub Actions secrets as `MY_EXECUTION_ROLE_ARN`.
- ECS Task Role  
  Save the ARN of this role to GitHub Actions secrets as `MY_TASK_ROLE_ARN`.
- Role for deployment  
  This role contains permissions of CloudFormation, ECS, ECR and CloudWatch Logs. Furthermore, `iam:PassRole` for the above two roles is needed.  
  Save the ARN of this role to GitHub Actions secrets as `MY_DEPLOYMENT_ROLE_ARN`.
- Set up for GitHub's OpenID Connect  
  See [Configuring OpenID Connect in Amazon Web Services - GitHub Docs](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services). By OIDC, the role for deployment must be authorized.

## Deployment
### ECR repository
This resource must be deployed first.

```sh
./infra/sh/01-ecr.sh
```

### The others(ECS task, docker image, CloudWatch Logs)
Put a Git tag beginning from `v` and see the GitHub Actions page.

## Rollback
Re-run the GitHub Actions workflow you wanna re-deploy.

