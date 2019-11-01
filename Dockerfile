FROM debian:stable-slim

MAINTAINER Mihoko-Okayami <https://hub.docker.com/r/mihokookayami/rust/>

RUN set -eux; \
	apt-get update && apt-get install -y --no-install-recommends ca-certificates libsqlite3-0 lib32gcc1 lib32stdc++6 unzip wget; \
	wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -O /tmp/steamcmd.tar.gz; \
	mkdir /steam && tar -xvf /tmp/steamcmd.tar.gz -C /steam; \
	/steam/steamcmd.sh +login anonymous +force_install_dir /data +app_update 258550 validate +quit; \
	wget https://github.com/OxideMod/Oxide.Rust/releases/latest/download/Oxide.Rust-linux.zip -O /tmp/oxide.zip; \
	unzip -o /tmp/oxide.zip -d /data; \
	apt-get remove -y unzip wget && apt-get autoremove && apt-get clean; \
	rm -rf /tmp/* /data/runds.sh; \
	ulimit -n 2048

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/data/RustDedicated_Data/Plugins/x86_64

EXPOSE 28015 28016

WORKDIR /data

CMD ./RustDedicated -batchmode -server.ip "$SERVER_IP" -server.port "$SERVER_PORT" -rcon.ip "$RCON_IP" -rcon.port "$RCON_PORT" -rcon.web "1" -rcon.password "$RCON_PASSWORD" -server.maxplayers "$SERVER_MAXPLAYERS" -server.hostname "$SERVER_HOSTNAME" -server.identity "$SERVER_IDENTITY" -server.level "$SERVER_LEVEL" -server.seed "$SERVER_SEED" -server.worldsize "$SERVER_WORLDSIZE" -server.saveinterval "$SERVER_SAVEINTERVAL" -server.globalchat "$SERVER_GLOBALCHAT" -server.description "$SERVER_DESCRIPTION" -server.headerimage "$SERVER_HEADERIMAGE" -server.url "$SERVER_URL"
