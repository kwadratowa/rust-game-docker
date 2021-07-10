FROM debian:latest

LABEL maintainer="Mihoko-Okayami (https://hub.docker.com/r/mihokookayami/rust/)"

ARG DEBIAN_FRONTEND=noninteractive

RUN set -eux; \
	dpkg --add-architecture i386; \
	apt-get update && apt-get install -y --no-install-recommends ca-certificates lib32gcc1 libsdl2-2.0-0:i386 locales wget; \
	wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -O /tmp/steamcmd.tar.gz; \
	mkdir /steam && tar -xvf /tmp/steamcmd.tar.gz -C /steam; \
	echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen; \
	rm -rf /tmp/* && rm -rf /var/lib/apt/lists/*

CMD /steam/steamcmd.sh +login anonymous +force_install_dir /data +app_update 258550 validate +quit