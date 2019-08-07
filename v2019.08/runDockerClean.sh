#!/usr/bin/env bash

#Delete all containers, all images, all data for Mysql,ES,Mongo,Redis,Cerebro docker environments

DOCKERFILE="docker-compose.yml"

ELASTIC_DOCKER_CONTAINER_NAME="elastic_docker_es6"

ENVIRONMENTBUILD=$1

if [ -z "$1" ] ; then
    echo 'Defaulting to use docker-compose.yml'
    echo 'Use rel as input parameter to use docker-compose-rel.yml'
	echo 'Note this script takes a few moments when downloading docker images'
fi

if [ -n "$1" ] ; then
    echo 'Using docker file docker-compose-'$1'.yml'
	
DOCKERFILE="docker-compose-"$1".yml"

ELASTIC_DOCKER_CONTAINER_NAME="elastic_docker_"$1"_es6"

fi

if [ -f $DOCKERFILE ]; then
   echo "File $DOCKERFILE exists."
else
   echo "File $DOCKERFILE does not exist."
   exit
fi

# Stop All Running Docker Containers

docker stop $(docker ps -a -q)

Stop All Running Docker Containers/Images/Volumes

# Delete Containers

docker-compose -f ./$DOCKERFILE rm 

#Delete Images

docker-compose -f ./$DOCKERFILE  down --rmi all

#Delete unused images
docker image prune --force --all

#Delete Data Volumes

docker-compose -f ./$DOCKERFILE down -v

#Delete Unused Volumes

docker volume prune -f

#Create New Containers/Images/Volumes

docker-compose -f ./$DOCKERFILE up -d 

#Wait for elastic to install

sleep 120s

# Install Elastic Search Plugins 

docker exec  $ELASTIC_DOCKER_CONTAINER_NAME /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-phonetic

#Stop and start elastic for plugins to take effect

docker stop $ELASTIC_DOCKER_CONTAINER_NAME

sleep 120s

docker start $ELASTIC_DOCKER_CONTAINER_NAME

echo "DONE!"







      
