FROM debian:stable-slim

MAINTAINER Mihoko-Okayami <https://hub.docker.com/r/mihokookayami/rust/>

RUN set -eux; \
	apt-get update && apt-get install -y --no-install-recommends libsqlite3-0 lib32gcc1t; \
	apt-get autoremove && apt-get clean; \
	ulimit -n 2048

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/data/RustDedicated_Data/Plugins/x86_64

EXPOSE 28015 28016

WORKDIR /data

CMD ./RustDedicated -batchmode -server.ip "$SERVER_IP" -server.port "$SERVER_PORT" -rcon.ip "$RCON_IP" -rcon.port "$RCON_PORT" -rcon.web "1" -rcon.password "$RCON_PASSWORD" -server.maxplayers "$SERVER_MAXPLAYERS" -server.hostname "$SERVER_HOSTNAME" -server.identity "$SERVER_IDENTITY" -server.level "$SERVER_LEVEL" -server.seed "$SERVER_SEED" -server.worldsize "$SERVER_WORLDSIZE" -server.saveinterval "$SERVER_SAVEINTERVAL" -server.globalchat "$SERVER_GLOBALCHAT" -server.description "$SERVER_DESCRIPTION" -server.headerimage "$SERVER_HEADERIMAGE" -server.url "$SERVER_URL"
