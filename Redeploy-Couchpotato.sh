#!/bin/sh

for i in `docker ps -a |grep -i couchpotato |awk '{print $1}'`
do
	docker stop $i
    docker rm $i
done

for i in `docker images |grep -i couchpotato |awk '{print $3}'`
do
	docker rmi $i
done
# --net=host \

docker run -dt --name couchpotato --restart=always \
--net=host \
-v /docker/couchpotato:/config \
-v /mnt:/mnt \
-e TZ='America/Chicago' \
-e PGID=0 -e PUID=0 \
-p 5050:5050 \
linuxserver/couchpotato
