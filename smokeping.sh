docker run \
  --name=smokeping \
  --rm \
  -d \
  -e PUID=1000 \
  -e PGID=1000 \
  -p 8081:80 \
  -e TZ='America/Chicago' \
  -v /smokeping/config:/config \
  -v /smokeping/data:/data \
  linuxserver/smokeping
