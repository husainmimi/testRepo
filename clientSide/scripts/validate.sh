#!/bin/sh
packageName="httpd.x86_64" 
if [ "$(yum list installed | grep -o $packageName)" == "$packageName"  ]
then
echo "$packageName installed successfully from repo $(yum list installed | grep  $packageName|awk '{ print $3 }')"
else
echo "there is error while install $packageName"
fi
