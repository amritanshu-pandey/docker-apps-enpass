#!/bin/bash

set -eu

VERSION=6.0.6.323
DOCKER_REPO=${1:-amritanshu16}

docker build -t "${DOCKER_REPO}/enpass:${VERSION}" .
docker tag "${DOCKER_REPO}/enpass:${VERSION}" "${DOCKER_REPO}/enpass:latest"
