#!/bin/sh

cd `dirname $0` || exit 1
. ./constants.txt

PROJECT_NAME=SampleGAEcsRollback

IMAGE_VERSION=$1

aws cloudformation deploy --template-file "../cfn/task.yaml" \
                          --stack-name "$PROJECT_NAME-Task" \
                          --parameter-overrides \
                            ProjectName="$PROJECT_NAME" \
                            MyExecutionRoleArn="$MY_EXECUTION_ROLE_ARN" \
                            MyTaskRoleArn="$MY_TASK_ROLE_ARN" \
                            ImageVersion="$IMAGE_VERSION"

