#!/bin/sh

for i in `docker ps -a |grep -i sonarr |awk '{print $1}'`
do
	docker stop $i
    docker rm $i
done

for i in `docker images |grep -i sonarr |awk '{print $3}'`
do
	docker rmi $i
done

# --net=host \
docker run -dt --name sonarr --restart=always \
-v /linux-tools/docker/sonarr:/config \
-v /mnt:/mnt \
-e TZ='America/Chicago' \
-e PGID=0 -e PUID=0 \
-p 8989:8989 \
linuxserver/sonarr
