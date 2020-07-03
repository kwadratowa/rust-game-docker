FROM debian:stable-slim

LABEL maintainer="Mihoko-Okayami (https://hub.docker.com/r/mihokookayami/rust/)"

RUN set -eux; \
	apt-get update && apt-get install -y ca-certificates lib32gcc1 locales wget && locale-gen en_US.UTF-8; \
	wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -O /tmp/steamcmd.tar.gz; \
	mkdir /steam && tar -xvf /tmp/steamcmd.tar.gz -C /steam; \
	apt-get remove -y wget && apt-get autoremove -y && apt-get clean; \
	rm -rf /tmp/*

CMD /steam/steamcmd.sh +login anonymous +force_install_dir /data +app_update 258550 validate +quit
