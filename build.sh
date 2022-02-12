#!/bin/sh

docker buildx build -t artur9010/rust:update-server -f update-server.Dockerfile --platform linux/amd64 .
docker push artur9010/rust:update-server
docker buildx build -t artur9010/rust:update-oxide -f update-oxide.Dockerfile --platform linux/amd64 .
docker push artur9010/rust:update-oxide
docker buildx build -t artur9010/rust:launcher-custom-map -f launcher.Dockerfile --platform linux/amd64 .
docker push artur9010/rust:launcher
