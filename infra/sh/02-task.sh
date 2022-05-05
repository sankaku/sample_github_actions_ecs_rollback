#!/bin/sh

cd `dirname $0` || exit 1

PROJECT_NAME=SampleGAEcsRollback
IMAGE_VERSION=$1

# Environment variables below will be given by GitHub Actions.
#
# MY_EXECUTION_ROLE_ARN
# MY_TASK_ROLE_ARN

aws cloudformation deploy --template-file "../cfn/task.yaml" \
                          --stack-name "$PROJECT_NAME-Task" \
                          --parameter-overrides \
                            ProjectName="$PROJECT_NAME" \
                            MyExecutionRoleArn="$MY_EXECUTION_ROLE_ARN" \
                            MyTaskRoleArn="$MY_TASK_ROLE_ARN" \
                            ImageVersion="$IMAGE_VERSION"

