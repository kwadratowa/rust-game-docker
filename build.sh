#!/bin/ash
docker buildx build --platform=linux/amd64 --push -t mihokookayami/rust:update-server . -f update-server.Dockerfile
docker buildx build --platform=linux/amd64 --push -t mihokookayami/rust:update-oxide . -f update-oxide.Dockerfile
docker buildx build --platform=linux/amd64 --push -t mihokookayami/rust:launcher . -f launcher.Dockerfile
