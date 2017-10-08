#!/bin/sh

if [[ ! -d /linux-tools/docker/nzbget/appdata ]]
then
	echo "Folder not found, creating now."
	mkdir -p /linux-tools/docker/nzbget/appdata
fi

if [[ ! -d /linux-tools/docker/nzbget/downloads ]]
then
        echo "Folder not found, creating now."
        mkdir -p /linux-tools/docker/nzbget/downloads
fi

for i in `docker ps -a |grep -i nzbget |awk '{print $1}'`
do
	docker stop $i
    docker rm $i
done

for i in `docker images |grep -i nzbget |awk '{print $3}'`
do
	docker rmi $i
done

docker run -dt  \
    --name nzbget \
    --restart=always \
    -p 6789:6789 \
    -e PUID=0 -e PGID=0 \
    -e TZ='America/Chicago' \
    -v /linux-tools/docker/nzbget/appdata:/config \
    -v /linux-tools/docker/nzbget/downloads:/downloads \
    linuxserver/nzbget

