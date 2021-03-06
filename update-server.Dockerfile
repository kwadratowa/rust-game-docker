FROM debian:stable-slim

LABEL maintainer="Mihoko-Okayami (https://hub.docker.com/r/mihokookayami/rust/)"

ARG DEBIAN_FRONTEND=noninteractive

RUN set -eux; \
	apt-get update && apt-get install -y --no-install-recommends ca-certificates lib32gcc1 locales wget; \
	locale-gen --purge en_US.UTF-8; \
	wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -O /tmp/steamcmd.tar.gz; \
	mkdir /steam && tar -xvf /tmp/steamcmd.tar.gz -C /steam; \
	apt-get remove -y wget locales && apt-get autoremove -y; \
	rm -rf /tmp/* && rm -rf /var/lib/apt/lists/*

CMD /steam/steamcmd.sh +login anonymous +force_install_dir /data +app_update 258550 validate +quit