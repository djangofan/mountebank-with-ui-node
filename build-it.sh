#!/bin/bash
IMAGE_NAME=djangofan/mountebank-with-ui-node
docker build -t djangofan/mountebank-with-ui-node:latest .

docker images | grep djangofan/mountebank-with-ui-node
