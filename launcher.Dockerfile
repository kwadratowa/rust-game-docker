FROM debian:bullseye-slim

LABEL maintainer="Mihoko-Okayami (https://hub.docker.com/r/mihokookayami/rust/)"

ARG SERVER_IP="0.0.0.0"
ARG SERVER_PORT="28015"
ARG RCON_IP="0.0.0.0"
ARG RCON_PORT="28016"
ARG RCON_PASSWORD="password"
ARG RCON_WEB="1"
ARG APP_PORT="28082"
ARG APP_LISTENIP="0.0.0.0"
ARG APP_PUBLICIP="0.0.0.0"
ARG SERVER_MAXPLAYERS="128"
ARG SERVER_HOSTNAME="A docker server"
ARG SERVER_IDENTITY="docker"
ARG SERVER_LEVEL="Procedural Map"
ARG SERVER_SEED="1337"
ARG SERVER_WORLDSIZE="2048"
ARG SERVER_SAVEINTERVAL="300"
ARG SERVER_GAMEMODE="vanilla"
ARG SERVER_GLOBALCHAT="true"
ARG SERVER_DESCRIPTION="A docker server"
ARG SERVER_HEADERIMAGE="https://avatars1.githubusercontent.com/u/1248652"
ARG SERVER_URL="https://github.com/Mihoko-Okayami/rust/"

ENV SERVER_IP "$SERVER_IP"
ENV SERVER_PORT "$SERVER_PORT"
ENV RCON_IP "$RCON_IP"
ENV RCON_PORT "$RCON_PORT"
ENV RCON_PASSWORD "$RCON_PASSWORD"
ENV RCON_WEB "$RCON_WEB"
ENV APP_PORT "$APP_PORT"
ENV APP_LISTENIP "$APP_LISTENIP"
ENV APP_PUBLICIP "$APP_PUBLICIP"
ENV SERVER_MAXPLAYERS "$SERVER_MAXPLAYERS"
ENV SERVER_HOSTNAME "$SERVER_HOSTNAME"
ENV SERVER_IDENTITY "$SERVER_IDENTITY"
ENV SERVER_LEVEL "$SERVER_LEVEL"
ENV SERVER_SEED "$SERVER_SEED"
ENV SERVER_WORLDSIZE "$SERVER_WORLDSIZE"
ENV SERVER_SAVEINTERVAL "$SERVER_SAVEINTERVAL"
ENV SERVER_GAMEMODE "$SERVER_GAMEMODE"
ENV SERVER_GLOBALCHAT "$SERVER_GLOBALCHAT"
ENV SERVER_DESCRIPTION "$SERVER_DESCRIPTION"
ENV SERVER_HEADERIMAGE "$SERVER_HEADERIMAGE"
ENV SERVER_URL "$SERVER_URL"

ARG DEBIAN_FRONTEND=noninteractive

RUN set -eux; \
	apt-get update && apt-get install -y --no-install-recommends ca-certificates libsdl2-2.0-0 libsqlite3-0 locales; \
	echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen; \
	rm -rf /tmp/* && rm -rf /var/lib/apt/lists/*

ENV LD_LIBRARY_PATH "$LD_LIBRARY_PATH:/data/RustDedicated_Data/Plugins/x86_64"

WORKDIR /data

CMD ./RustDedicated -batchmode -load -nographics -server.ip "$SERVER_IP" -server.port "$SERVER_PORT" -rcon.ip "$RCON_IP" -rcon.port "$RCON_PORT" -rcon.password "$RCON_PASSWORD" -rcon.web "$RCON_WEB" -app.port "$APP_PORT" -app.listenip "$APP_LISTENIP" -app.publicip "$APP_PUBLICIP" -server.maxplayers "$SERVER_MAXPLAYERS" -server.hostname "$SERVER_HOSTNAME" -server.identity "$SERVER_IDENTITY" -server.level "$SERVER_LEVEL" -server.seed "$SERVER_SEED" -server.worldsize "$SERVER_WORLDSIZE" -server.saveinterval "$SERVER_SAVEINTERVAL" -server.gamemode "$SERVER_GAMEMODE" -server.globalchat "$SERVER_GLOBALCHAT" -server.description "$SERVER_DESCRIPTION" -server.headerimage "$SERVER_HEADERIMAGE" -server.url "$SERVER_URL"