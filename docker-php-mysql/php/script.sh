#!/bin/bash
echo "Building and pushing PHP Docker image..."

docker build -t php .
docker run php
docker tag php sodg/php:latest
docker login
docker push sodg/php:latest