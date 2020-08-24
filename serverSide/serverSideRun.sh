#!/bin/sh


containerName="serverSide"
imageName="serverside"
dockerFile="serverSide/centosServDF"
########################## build a serverSide container and name it server Side 
########################## from centosServSideDF

docker build . -f $dockerFile -t $imageName
docker run -it  --name=$containerName $imageName 

