#!/bin/sh

for i in `docker ps -a |grep -i plex |awk '{print $1}'`
do
	docker stop $i
    docker rm $i
done

for i in `docker images |grep -i plex |awk '{print $3}'`
do
	docker rmi $i
done

docker run -dt --name plex --restart=always \
--net=host \
-v /linux-tools/docker/plex:/config \
-v /mnt:/mnt \
-e TZ='America/Chicago' \
-e PGID=0 -e PUID=0 \
-p 32400:32400 \
linuxserver/plex
