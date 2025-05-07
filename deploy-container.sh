#TARGET=user@host DOCKERIO_USERNAME=username bash deploy-container.sh

ssh "$TARGET" "bash -c ' \
    export DOCKERIO_USERNAME=$DOCKERIO_USERNAME; \
    docker pull docker.io/\${DOCKERIO_USERNAME}/hello-node:latest && \
    docker stop hello-node || true && \
    docker rm hello-node || true && \
    docker run -d \
        --name hello-node \
        -p 3000:8080 \
        --restart unless-stopped \
        docker.io/\${DOCKERIO_USERNAME}/hello-node:latest; \
    docker ps'"