#!/bin/sh

for i in `docker ps -a |grep -i cacti |awk '{print $1}'`
do
	docker stop $i
    docker rm $i
done

for i in `docker images |grep -i cacti |awk '{print $3}'`
do
	docker rmi $i
done

# --net=host \
docker run \
-dt \
-p 80:80  \
quantumobject/docker-cacti
