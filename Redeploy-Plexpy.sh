#!/bin/sh

for i in `docker ps -a |grep -i plexpy |awk '{print $1}'`
do
	docker stop $i
    docker rm $i
done

for i in `docker images |grep -i plexpy |awk '{print $3}'`
do
	docker rmi $i
done

# docker run -dt --name plexpy --restart=always -v /docker/plexpy:/config -v /docker/plexpy/plexlogs:/logs:ro -e PGID=0 -e PUID=0 -e TZ='America/Chicago' -p 8182:8181 linuxserver/plexpy

# --net=host \

docker run -dt --name plexpy \
--restart=always \
-v /docker/plexpy:/config \
-v /docker/plexpy/plexlogs:/logs:ro \
-e PGID=0 -e PUID=0 \
-e TZ='America/Chicago' \
-p 8182:8181 \
linuxserver/plexpy
