
# VirtualRadarServer for Docker
Docker Image for VirtualRadarServer using Linux and Mono (https://www.virtualradarserver.co.uk/). \
DockerHub: https://hub.docker.com/r/felixtech/virtualradarserver

## Installation Instructions
1. Create an empty folder: `mkdir /opt/virtualradar`
2. Copy the Docker Compose file from below and paste it into that folder: `nano /opt/virtualradar/docker-compose.yml`
3. Start the Stack: `docker compose up -d`
4. Go to the volume created by the Stack: `cd /var/lib/docker/volumes/virtualradar_data/_data`
5. Optional: Download the Airline Logos:
   1. Create a folder named OperatorFlags: `mkdir OperatorFlags`
   2. Open the folder: `cd OperatorFlags`
   3. Download the OperatorFlags: `wget https://github.com/rikgale/VRSOperatorFlags/blob/main/OperatorFlags.zip`
   4. Unzip the downloaded file: `unzip OperatorFlags.zip`
   5. Remove the downloaded file: `rm OperatorFlags.zip`
   6. Go back to the volume: `cd ..`
6. Optional: Download the Aircraft Silhouettes:
   1. Create a folder named OperatorFlags: `mkdir Silhouettes`
   2. Open the folder: `cd Silhouettes`
   3. Download the Silhouettes: `wget https://github.com/rikgale/VRSOperatorFlags/blob/main/Silhouettes.zip`
   4. Unzip the downloaded file: `unzip Silhouettes.zip`
   5. Remove the downloaded file: `rm Silhouettes.zip`
   6. Go back to the volume: `cd ..`
7. Continue at the Configuration Instructions

### Docker Compose
```
version: "3.8"

volumes:
  data:

services:
  virtualradar:
    image: felixtech/virtualradarserver:latest
    container_name: virtualradar
    volumes:
      - data:/root/.local/share/VirtualRadar
    ports:
      - 8080:8080
    restart: always
```

## Configuration Instructions
1. Open the VRS Admin page: `http://<your-dockerhost-ip>:8080/WebAdmin/` and login with the default credentials (admin/password).
2. Go to `Options -> Data Sources` and set the following paths (if you did the optional steps from before):
    * Flags folder: `/root/.local/share/VirtualRadar/OperatorFlags/`
    * Silhouettes folder: `/root/.local/share/VirtualRadar/Silhouettes/`
3. Set up your Receiver Locations.
4. Set up your Receivers.
5. Create a Merged Feed with all your receivers, if you have more than one.
6. Change the password of the admin user.
7. Save your changes!
8. Go to `Plugin: Database Writer` and check the `Enabled` checkbox, select your feed (or if you have multiple feeds, the Merged Feed you created before) and click `Use default file name`. Check `Save online lookups in database` and `Overwrite details on existing aircraft` and click `Create Database` and then click `Save`.
9. Optional: Go to `Plugin: Tile Server Cache` and enable the plugin and ensure `Use default cache folder` is checked.
10. Go back to `Options -> Data Sources -> Database filename`and set `/root/.local/share/VirtualRadar/BaseStation.sqb` as the path and click save. 

## Default Credentials
User: admin \
Password: password

## Support
If you need support for this, just create an Issue on GitHub.
