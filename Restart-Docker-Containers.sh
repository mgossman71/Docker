#!/bin/sh

for i in `docker ps |egrep -iv 'CONTAINER|jenkins' |awk '{print $1}'`
do
	echo "Stopping $i"
	docker stop $i
	echo "sleeping for 2 seconds."
	sleep 2
	echo "Starting $i"
	docker start $i
done

