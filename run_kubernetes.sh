#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
DOCKER_IMAGE=rikuvan/ml-project
DEPLOYMENT_NAME="${1:-ml-project}"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deploy $DEPLOYMENT_NAME --image=$DOCKER_IMAGE

echo "Waiting for container to be created"
sleep 20

# Step 3:
# List kubernetes pods
kubectl get deploy,rs,svc,pods
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo "Pod is $POD_NAME"

# Step 4:
# Forward the container port to a host
kubectl port-forward $POD_NAME 8000:80

kubectl logs --follow $POD_NAME

# to query after stopping script use
# kubectl logs $POD_NAME --since=1h
