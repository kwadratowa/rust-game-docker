FROM debian:stable-slim

LABEL maintainer="Mihoko-Okayami (https://hub.docker.com/r/mihokookayami/rust/)"

ENV LANG=en_US.UTF-8

RUN apt-get update && apt-get install -y ca-certificates locales unzip wget && sed -i -e "s/# $LANG.*/$LANG.UTF-8 UTF-8/" /etc/locale.gen && dpkg-reconfigure --frontend=noninteractive locales && update-locale LANG=$LANG

CMD wget https://github.com/OxideMod/Oxide.Rust/releases/latest/download/Oxide.Rust-linux.zip -O /tmp/oxide.zip && unzip -o /tmp/oxide.zip -d /data && rm /tmp/oxide.zip
