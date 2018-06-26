#!/bin/sh

for i in `docker ps -a |grep -i plexrequests |awk '{print $1}'`
do
	docker stop $i
    docker rm $i
done

for i in `docker images |grep -i plexrequests |awk '{print $3}'`
do
	docker rmi $i
done

# --net=host \
docker run -dt \
--net=host \
--name=plexrequests \
--restart=always \
-v /etc/localtime:/etc/localtime:ro \
-v /linux-tools/docker/plexreq:/config \
-v /linux-tools/docker/sonarr:/sonarr \
-v /linux-tools/docker/couchpotato:/couchpotato \
-v //mnt/TV-Shows:/tv1
-e PGID=0 -e PUID=0  \
-p 3000:3000 \
linuxserver/plexrequests
