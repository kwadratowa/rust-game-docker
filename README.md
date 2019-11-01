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
          SERVER_IP: "127.0.0.1"
          SERVER_PORT: "28015"
          RCON_IP: "127.0.0.1"
          RCON_PORT: "28016"
          RCON_PASSWORD: "my-rcon-password"
          SERVER_MAXPLAYERS: "100"
          SERVER_HOSTNAME: "A docker server"
          SERVER_IDENTITY: "docker"
          SERVER_LEVEL: "Procedural Map"
          SERVER_SEED: "1337"
          SERVER_WORLDSIZE: "1024"
          SERVER_SAVEINTERVAL: "300"
          SERVER_GLOBALCHAT: "true"
          SERVER_DESCRIPTION: "A docker server"
          SERVER_HEADERIMAGE: "https://avatars1.githubusercontent.com/u/1248652"
          SERVER_URL: "https://github.com/Mihoko-Okayami/rust/"
        restart: unless-stopped
