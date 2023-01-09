#!/usr/bin/env bash

IMAGE_NAME=rikuvan/ml-project
HOST_PORT=8000
TARGET="${1:-$HOME/tmp}"

# Step 1:
# Build image and add a descriptive tag
echo "📦 docker image: ${IMAGE_NAME}"
docker build . -t $IMAGE_NAME --no-cache

# Step 2: 
# List docker images
docker images

# Step 3: 
# Run flask app
docker run --name ml-project-container -p "${HOST_PORT}:80" -v $TARGET:/app/logs $IMAGE_NAME
echo "app 🏃 on ${HOST_PORT}"
echo "logs written to ${TARGET}"
