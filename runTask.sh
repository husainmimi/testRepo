#!/bin/sh
###################################################################################
#containerName, imageName represent name of serverSide 
#containerName2, imageName2 represent name of client side 
###################################################################################

########################## remove a Container named serverSide#####################3
containerName="serverSide"
imageName="serverside"
if [ "$(docker ps | grep -o  $containerName)" == "$containerName" ]
then
docker stop $containerName > /dev/null
fi

if [ "$(docker ps -a | grep -o  $containerName)" == "$containerName" ]
then
docker rm $containerName > /dev/null
fi


#######################################################################################

########################## remove a Container named clientSide#####################3
containerName2="clientSide"
imageName2="clientside"
if [ "$(docker ps | grep -o  $containerName2)" == "$containerName2" ]
then
docker stop $containerName2 > /dev/null
fi

if [ "$(docker ps -a | grep -o  $containerName2)" == "$containerName2" ]
then
docker rm $containerName2 > /dev/null
fi


#######################################################################################

./networkConf.sh
./serverSideRun.sh






