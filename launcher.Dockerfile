FROM debian:bullseye-slim

LABEL maintainer="Mihoko-Okayami (https://hub.docker.com/r/mihokookayami/rust/)"

ARG APP_LISTENIP="0.0.0.0"
ARG APP_PORT="28082"
ARG APP_PUBLICIP="0.0.0.0"
ARG RCON_IP="0.0.0.0"
ARG RCON_PASSWORD="password"
ARG RCON_PORT="28016"
ARG RCON_WEB="1"
ARG SERVER_CYCLETIME="500"
ARG SERVER_DESCRIPTION="A docker server"
ARG SERVER_GAMEMODE="vanilla"
ARG SERVER_GLOBALCHAT="true"
ARG SERVER_HEADERIMAGE="https://pix.milkywan.fr/l12PQLIp.png"
ARG SERVER_HOSTNAME="A docker server"
ARG SERVER_IDENTITY="docker"
ARG SERVER_IDLEKICK="30"
ARG SERVER_IDLEKICKADMINS="0"
ARG SERVER_IDLEKICKMODE="1"
ARG SERVER_IP="0.0.0.0"
ARG SERVER_LEVEL="Procedural Map"
ARG SERVER_LOGOIMAGE="https://pix.milkywan.fr/dP3oOktP.png"
ARG SERVER_MAXPLAYERS="128"
ARG SERVER_MOTD="Welcome to my Docker server"
ARG SERVER_PORT="28015"
ARG SERVER_RADIATION="true"
ARG SERVER_SAVEINTERVAL="300"
ARG SERVER_SEED="1337"
ARG SERVER_TAGS=""
ARG SERVER_TICKRATE="30"
ARG SERVER_URL="https://github.com/Mihoko-Okayami/rust/"
ARG SERVER_WORLDSIZE="2048"

ENV APP_LISTENIP "$APP_LISTENIP"
ENV APP_PORT "$APP_PORT"
ENV APP_PUBLICIP "$APP_PUBLICIP"
ENV RCON_IP "$RCON_IP"
ENV RCON_PASSWORD "$RCON_PASSWORD"
ENV RCON_PORT "$RCON_PORT"
ENV RCON_WEB "$RCON_WEB"
ENV SERVER_CYCLETIME "$SERVER_CYCLETIME"
ENV SERVER_DESCRIPTION "$SERVER_DESCRIPTION"
ENV SERVER_GAMEMODE "$SERVER_GAMEMODE"
ENV SERVER_GLOBALCHAT "$SERVER_GLOBALCHAT"
ENV SERVER_HEADERIMAGE "$SERVER_HEADERIMAGE"
ENV SERVER_HOSTNAME "$SERVER_HOSTNAME"
ENV SERVER_IDENTITY "$SERVER_IDENTITY"
ENV SERVER_IDLEKICK "$SERVER_IDLEKICK"
ENV SERVER_IDLEKICKADMINS "$SERVER_IDLEKICKADMINS"
ENV SERVER_IDLEKICKMODE "$SERVER_IDLEKICKMODE"
ENV SERVER_IP "$SERVER_IP"
ENV SERVER_LEVEL "$SERVER_LEVEL"
ENV SERVER_LOGOIMAGE "$SERVER_LOGOIMAGE"
ENV SERVER_MAXPLAYERS "$SERVER_MAXPLAYERS"
ENV SERVER_MOTD "$SERVER_MOTD"
ENV SERVER_PORT "$SERVER_PORT"
ENV SERVER_RADIATION "$SERVER_RADIATION"
ENV SERVER_SAVEINTERVAL "$SERVER_SAVEINTERVAL"
ENV SERVER_SEED "$SERVER_SEED"
ENV SERVER_TAGS "$SERVER_TAGS"
ENV SERVER_TICKRATE "$SERVER_TICKRATE"
ENV SERVER_URL "$SERVER_URL"
ENV SERVER_WORLDSIZE "$SERVER_WORLDSIZE"

ARG DEBIAN_FRONTEND=noninteractive

RUN set -eux; \
	apt-get update && apt-get install -y --no-install-recommends ca-certificates libsdl2-2.0-0 libsqlite3-0 locales; \
	echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen; \
	rm -rf /tmp/* && rm -rf /var/lib/apt/lists/*

ENV LD_LIBRARY_PATH "$LD_LIBRARY_PATH:/data/RustDedicated_Data/Plugins/x86_64"

WORKDIR /data

CMD ./RustDedicated -batchmode -silent-crashes -app.listenip "$APP_LISTENIP" -app.port "$APP_PORT" -app.publicip "$APP_PUBLICIP" -rcon.ip "$RCON_IP" -rcon.password "$RCON_PASSWORD" -rcon.port "$RCON_PORT" -rcon.web "$RCON_WEB" -server.cycletime "$SERVER_CYCLETIME" -server.description "$SERVER_DESCRIPTION" -server.gamemode "$SERVER_GAMEMODE" -server.globalchat "$SERVER_GLOBALCHAT" -server.headerimage "$SERVER_HEADERIMAGE" -server.hostname "$SERVER_HOSTNAME" -server.identity "$SERVER_IDENTITY" -server.idlekick "$SERVER_IDLEKICK" --server.idlekickadmins "$SERVER_IDLEKICKADMINS" -server.idlekickmode "$SERVER_IDLEKICKMODE" -server.ip "$SERVER_IP" -server.level "$SERVER_LEVEL" -server.logoimage "$SERVER_LOGOIMAGE" -server.maxplayers "$SERVER_MAXPLAYERS" -server.motd "$SERVER_MOTD" -server.port "$SERVER_PORT" -server.radiation "$SERVER_RADIATION" -server.saveinterval "$SERVER_SAVEINTERVAL" -server.seed "$SERVER_SEED" -server.tags "$SERVER_TAGS" -server.tickrate "$SERVER_TICKRATE" -server.url "$SERVER_URL" -server.worldsize "$SERVER_WORLDSIZE"