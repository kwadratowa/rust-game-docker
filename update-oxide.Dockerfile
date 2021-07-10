FROM debian:stable-slim

LABEL maintainer="Mihoko-Okayami (https://hub.docker.com/r/mihokookayami/rust/)"

ARG DEBIAN_FRONTEND=noninteractive

RUN set -eux; \
	apt-get update && apt-get install -y --no-install-recommends ca-certificates unzip wget; \
	rm -rf /tmp/* && rm -rf /var/lib/apt/lists/*

CMD wget https://github.com/OxideMod/Oxide.Rust/releases/latest/download/Oxide.Rust-linux.zip -O /tmp/oxide.zip && unzip -o /tmp/oxide.zip -d /data && rm /tmp/oxide.zip