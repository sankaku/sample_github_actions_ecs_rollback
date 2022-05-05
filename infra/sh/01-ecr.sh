#!/bin/sh

cd `dirname $0` || exit 1
PROJECT_NAME=SampleGAEcsRollback
PROJECT_NAME_SNAKE_CASE=sample_ga_ecs_rollback
REPOSITORY_NAME=app_image

aws cloudformation deploy --template-file "../cfn/ecr.yaml" \
                          --stack-name "$PROJECT_NAME-ECR" \
                          --parameter-overrides \
                            ProjectName=$PROJECT_NAME \
                            ProjectNameSnakeCase=$PROJECT_NAME_SNAKE_CASE \
                            RepositoryName=$REPOSITORY_NAME




