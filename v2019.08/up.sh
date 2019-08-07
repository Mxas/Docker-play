#!/usr/bin/env bash


sudo docker-compose up #-d

# sudo bash -lic "sudo docker exec -i -t redis_docker /bin/bash"


















## Standalone helpers:

## MYSQL
## docker run -d --name tpm-db-server -p 3306:3306 -e MYSQL_ROOT_PASSWORD=mysql -e MYSQL_DATABASE=tpm -e MYSQL_USER=egxapp -e MYSQL_PASSWORD=egxpass -v ghx-tpm:/var/lib/mysql mysql:5.6
## docker run -it --rm --name mysql-workbench -e DISPLAY=unix$DISPLAY -v ghx-mysql-workbench-data:/root/.mysql/workbench -v /tmp/.X11-unix:/tmp/.X11-unix jdecool/mysql-workbench

## MongoDB
## docker run -d -it --rm --name mongo-db -p 27017:27017 -v ghx-mongodata:/data/db mongo:3.6.3

## ES
## docker run -it --rm --name elasticsearch -p 9200:9200  -e network.host=0.0.0.0 -e cluster.name=applogs -e node.name=local-node -e discovery.zen.ping.multicast.enabled=false -e discovery.zen.ping.unicase.hosts=["localhost"] -v ghx-esdata:/usr/share/elasticsearch/data elasticsearch:5.6.8
## docker run -d -it --rm --name cerebro -p 9000:9000 yannart/cerebro:0.7.3

## Redis
## docker run -d -it --rm --name redis -d --rm -p 6379:6379 -v ghx-redis-data:/data redis redis-server --appendonly yes

## after stopping clear data
## docker volume prune
