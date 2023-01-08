#!/usr/bin/env bash

IMAGE_NAME=rikuvan/ml-project
HOST_PORT=8000

# Step 1:
# Build image and add a descriptive tag
echo "📦 docker image: ${IMAGE_NAME}"
docker build . -t $IMAGE_NAME --no-cache

# Step 2: 
# List docker images
docker images

# Step 3: 
# Run flask app
docker run --name "${IMAGE_NAME}-container" -p "${HOST_PORT}:80" $IMAGE_NAME
echo "app 🏃 on ${HOST_PORT}"
