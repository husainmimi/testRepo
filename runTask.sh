#!/bin/sh
###################################################################################
#containerName, imageName represent name of serverSide 
#containerName2, imageName2 represent name of client side 
###################################################################################
networkName="myNetwork"
########################## remove a Container named serverSide if exist #####################3
containerName="serverSide"
imageName="serverside"
if [ "$(docker ps | grep -o  $containerName)" == "$containerName" ] # check if it is running to stop it
then
docker stop $containerName > /dev/null
fi

if [ "$(docker ps -a | grep -o  $containerName)" == "$containerName" ] # check if it exist to remove it
then
docker rm $containerName > /dev/null
fi


#######################################################################################

########################## remove a Container named clientSide if exist #####################3
containerName2="clientSide"
imageName2="clientside"
if [ "$(docker ps | grep -o  $containerName2)" == "$containerName2" ] # check if it is running to stop it
then
docker stop $containerName2 > /dev/null
fi

if [ "$(docker ps -a | grep -o  $containerName2)" == "$containerName2" ] # check if it exist to remove it
then
docker rm $containerName2 > /dev/null
fi


#######################################################################################
# command to be exxecuted in in new tmux session

serverExecFile="./serverSide/serverSideRun.sh"
clientExecFile="./clientSide/clientSideRun.sh"

#######################################################################################

./networkConf.sh # creat new network name myNetwork and close old if exist to link serverSide with clientSide

tmux new-session -d -s $containerName $serverExecFile # open new tmux session named by the containerName 
sleep 120 # wait 2 minutes to get sure that all packages are downloaded in build
tmux new-session -d -s $containerName2 $clientExecFile # open new tmux session named by the containerName 
sleep 5 # wait 5 second to get sure that clientSide is running
 
docker network connect $networkName $containerName #connect serverSide to the network
sleep 2 # wait 2 second
docker network connect $networkName $containerName2 # connect clientSide to the network



