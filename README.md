Official website : https://rust.facepunch.com/  
Oxide website : https://umod.org/  
  
# Usage :  
  
### 1 : Use the "*update-server*" tag to update the Rust server files.
    docker run --rm -it -v /my/rust/path:/data mihokookayami/rust:update-server
  
### 2 : If you want to install oxide, use the "*update-oxide*" tag ( to do AFTER the server update ).  
    docker run --rm -it -v /my/rust/path:/data mihokookayami/rust:update-oxide
  
### 3 : Finally, launch your server with the tag "*launcher*".  
    version: "3.7"
    services:
      rust:
        image: mihokookayami/rust:launcher
        container_name: rust
        network_mode: host
        volumes:
          - /my/rust/path:/data
        environment:
          APP_LISTENIP: "127.0.0.1"
          APP_PORT: "28082"
          APP_PUBLICIP: "127.0.0.1"
          RCON_IP: "127.0.0.1"
          RCON_PASSWORD: "my-rcon-password"
          RCON_PORT: "28016"
          RCON_WEB: "1"
          SERVER_CYCLETIME: "500"
          SERVER_DESCRIPTION: "A docker server"
          SERVER_GAMEMODE: "vanilla"
          SERVER_GLOBALCHAT: "true"
          SERVER_HEADERIMAGE: "https://pix.milkywan.fr/l12PQLIp.png"
          SERVER_HOSTNAME: "A docker server"
          SERVER_IDENTITY: "docker"
          SERVER_IDLEKICK: "30"
          SERVER_IDLEKICKADMINS: "0"
          SERVER_IDLEKICKMODE: "1"
          SERVER_IP: "127.0.0.1"
          SERVER_LEVEL: "Procedural Map"
          SERVER_LOGOIMAGE: "https://pix.milkywan.fr/dP3oOktP.png"
          SERVER_MAXPLAYERS: "32"
          SERVER_MOTD: "A docker server"
          SERVER_PORT: "28015"
          SERVER_RADIATION: "true"
          SERVER_SAVEINTERVAL: "300"
          SERVER_SEED: "1337"
          SERVER_TAGS: ""
          SERVER_TICKRATE: "30"
          SERVER_URL: "https://github.com/Mihoko-Okayami/rust/"
          SERVER_WORLDSIZE: "1024"
        restart: unless-stopped
