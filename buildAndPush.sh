#!/bin/sh


export VERSION=$1

echo "version=$VERSION"

# aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 952478859445.dkr.ecr.us-east-1.amazonaws.com
docker build -t eksrunner:eksrunner$VERSION .
docker tag eksrunner:eksrunner$VERSION 795043606509.dkr.ecr.us-east-1.amazonaws.com/runner:eksrunner$VERSION
docker push 795043606509.dkr.ecr.us-east-1.amazonaws.com/runner:eksrunner$VERSION
