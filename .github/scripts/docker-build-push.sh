#!/bin/bash
set -e

# Get Latest tag
LATEST_TAG=$(git describe $(git rev-list --tags --max-count=1) --tags)

if [ -z $LATEST_TAG ]; then
    IMAGE_TAG="v0.1.0"
else
    IMAGE_TAG=${LATEST_TAG}
fi

# Build tekton-operator
operator-sdk build ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO_NAME}:${IMAGE_TAG}

# ECR login
$(aws ecr get-login --region $AWS_DEFAULT_REGION --no-include-email)

# Push image
docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO_NAME}:${IMAGE_TAG}