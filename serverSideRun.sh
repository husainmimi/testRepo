#!/bin/sh


containerName="serverSide"
imageName="serverside"
networkName="myNetwork"
dockerFile="centosServDF"
########################## build a serverSide container and name it server Side 
########################## from centosServSideDF

docker build . -f $dockerFile -t $imageName
docker run -it  --name=$containerName $imageName 
docker network connect $networkName $containerName
