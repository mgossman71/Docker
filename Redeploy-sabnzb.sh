#!/bin/sh

for i in `docker ps -a |grep -i sabnzb |awk '{print $1}'`
do
	docker stop $i
    docker rm $i
done

for i in `docker images |grep -i sabnzb |awk '{print $3}'`
do
	docker rmi $i
done

# --net=host \
docker run -dt --name sabnzb --restart=always \
-v /linux-tools/docker/sabnzb:/config \
-v /mnt:/mnt \
-e TZ='America/Chicago' \
-e PGID=0 -e PUID=0 \
-p 8080:8080 \
linuxserver/sabnzbd
