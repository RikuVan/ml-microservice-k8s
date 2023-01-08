#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=rikuvan/ml-project

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker image tag $dockerpath "${dockerpath}:latest"

# Step 3:
# Push image to a docker repository
docker image push $dockerpath
