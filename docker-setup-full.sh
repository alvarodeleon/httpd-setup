#!/bin/bash

mkdir -p $2/{html,mysql,backup,disk,nginx}

docker run -it --privileged --hostname="server" -e "container=docker" --cap-add SYS_ADMIN \
--tmpfs /run -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
-p 22:22 -p 80:80 -p 3306:3306 \
-v "$2/html:/var/www/html" \
-v "$2/nginx:/etc/nginx/conf.d" \
-v "$2/mysql/:/var/lib/mysql" \
-v "$2/backup/:/backup" \
-v "$2/disk/:/mnt/disk" \
--name $1 "alvarodeleon/centos7-nginx-multiphp" "/usr/sbin/init"
