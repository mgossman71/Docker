#!/bin/sh

for i in `docker ps -a |grep -i plex2 |awk '{print $1}'`
do
	docker stop $i
    docker rm $i
done

docker run -dt --name plex2 --restart=always \
--net=host \
-v /linux-tools/docker/plex2:/config \
-v /mnt:/mnt \
-e TZ='America/Chicago' \
-e PGID=0 -e PUID=0 \
-p 32400:32400 \
linuxserver/plex
