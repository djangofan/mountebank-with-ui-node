#!/bin/bash
IMAGE_NAME=djangofan/mountebank-with-ui-node
docker run -p 2424:80 -p 2525:2525 -p 9000:9000 -d djangofan/mountebank-with-ui-node

docker ps -l --no-trunc | grep djangofan/mountebank-with-ui-node

docker logs $(docker ps -a --no-trunc --filter=ancestor=djangofan/mountebank-with-ui-node -q)
