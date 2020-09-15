#!/bin/sh

for i in `docker ps -a |grep -i radarr |awk '{print $1}'`
do
	docker stop $i
    docker rm $i
done

for i in `docker images |grep -i radarr |awk '{print $3}'`
do
	docker rmi $i
done

# --net=host \
docker run -dt --name radarr --restart=always \
-v /linux-tools/docker/radarr:/config \
-v /mnt:/mnt \
-e TZ='America/Chicago' \
-e PGID=0 -e PUID=0 \
-p 7878:7878 \
linuxserver/radarr
