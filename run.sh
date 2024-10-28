#!/bin/bash

# Check if the image exists, and build it if it doesn't
IMAGE_NAME="anthropic-cli-app"
DOCKERFILE_PATH="."

docker build -t $IMAGE_NAME $DOCKERFILE_PATH || { echo "Docker build failed"; exit 1; }

# Run the Docker container with uv and pass in all arguments from the command line
docker run --rm --env-file .env -v "$(pwd):/app" "$IMAGE_NAME" uv run main "$@"
