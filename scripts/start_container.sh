#!/bin/bash

CONTAINER_NAME="simple-python-app"
IMAGE_NAME="winsin/simple-python-flask-app"

echo "Pull the latest image for $IMAGE_NAME"
docker pull $IMAGE_NAME 

echo "Starting the Docker container: $CONTAINER_NAME"
docker run -d --name $CONTAINER_NAME -p 80:5000 $IMAGE_NAME
