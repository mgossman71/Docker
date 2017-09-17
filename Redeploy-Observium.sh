#!/bin/sh

for i in `docker ps -a |grep -i observium |awk '{print $1}'`
do
	docker stop $i
    docker rm $i
done

for i in `docker images |grep -i observium |awk '{print $3}'`
do
	docker rmi $i
done

#mkdir -p /linux-tools/docker/observium/config
#mkdir -p /linux-tools/docker/observium/logs
#mkdir -p /linux-tools/docker/observium/rrd

docker run -dt \
--name observium \
--restart=always \
-v /linux-tools/docker/observium/config:/config \
-v /linux-tools/docker/observium/logs:/opt/observium/logs \
-v /linux-tools/docker/observium/rrd:/opt/observium/rrd \
-p 8668:8668 \
zuhkov/observium
