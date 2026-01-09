#!/bin/bash
echo "Building and pushing MySQL Docker image..."

docker build -t myimage .
docker run myimage
docker tag myimage sodg/myimage:latest
docker login
docker push sodg/myimage:latest