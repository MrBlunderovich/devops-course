#TARGET=user@host DOCKERIO_USERNAME=username bash deploy-container.sh

ssh "$TARGET" "bash -c ' \
    export DOCKERIO_USERNAME=$DOCKERIO_USERNAME; \
    docker pull docker.io/\${DOCKERIO_USERNAME}/hello-go:latest && \
    docker stop hello-go || true && \
    docker rm hello-go || true && \
    docker run -d \
        --name hello-go \
        -p 3000:8080 \
        --restart unless-stopped \
        docker.io/\${DOCKERIO_USERNAME}/hello-go:latest; \
    docker ps'"