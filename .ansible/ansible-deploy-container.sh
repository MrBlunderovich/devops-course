#!/bin/bash

set -e

docker pull "docker.io/${DOCKERIO_USERNAME}/hello-go:latest"

docker stop hello-go || true
docker rm hello-go || true

docker run -d \
  --name hello-go \
  -p 3000:8080 \
  --restart unless-stopped \
  "docker.io/${DOCKERIO_USERNAME}/hello-go:latest"

docker ps
