#!/bin/sh

for i in `docker ps -a |grep -i smokeping |awk '{print $1}'`
do
	docker stop $i
    docker rm $i
done

for i in `docker images |grep -i smokeping |awk '{print $3}'`
do
	docker rmi $i
done

docker run -dt --name smokeping --restart=always \
--net=host \
-v /linux-tools/docker/smokeping/data:/data \
-v /linux-tools/docker/smokeping/config:/config \
-e TZ='America/Chicago' \
-e PGID=0 -e PUID=0 \
-p 80:80 \
linuxserver/plex
