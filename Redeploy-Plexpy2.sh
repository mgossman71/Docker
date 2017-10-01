#!/bin/sh

for i in `docker ps -a |grep -i plexpy2 |awk '{print $1}'`
do
	docker stop $i
    docker rm $i
done

for i in `docker images |grep -i plexpy |awk '{print $3}'`
do
	docker rmi $i
done

# --net=host \
docker run -dt --name plexpy2 \
--restart=always \
-v /linux-tools/docker/plexpy2:/config \
-v /linux-tools/docker/plexpy2/plexlogs:/logs:ro \
-e PGID=0 -e PUID=0 \
-e TZ='America/Chicago' \
-p 8182:8181 \
linuxserver/plexpy
