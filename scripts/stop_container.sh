#!/bin/bash

CONTAINER_NAME="simple-python-app"

# Check if the container exists (running or stopped)
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "Container $CONTAINER_NAME exists."
    docker rm -f $CONTAINER_NAME 2>/dev/null
    echo "Container $CONTAINER_NAME has been removed."
    exit 0
else
    echo "Container $CONTAINER_NAME does not exist."
    echo "No action taken."
    exit 1
fi

# Check if the container is running
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping the container: $CONTAINER_NAME"
    docker stop $CONTAINER_NAME
    echo "Container $CONTAINER_NAME has been stopped."
    docker rm $CONTAINER_NAME
    echo "Container $CONTAINER_NAME has been removed."
    exit 0
else
    echo "Container $CONTAINER_NAME is not running."
fi

