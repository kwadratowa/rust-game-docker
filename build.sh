#!/bin/sh

docker build --network host -t mihokookayami/rust:update-server -f update-server.Dockerfile .
docker push mihokookayami/rust:update-server
docker build --network host -t mihokookayami/rust:update-oxide -f update-oxide.Dockerfile .
docker push mihokookayami/rust:update-oxide
docker build --network host -t mihokookayami/rust:launcher -f launcher.Dockerfile .
docker push mihokookayami/rust:launcher
