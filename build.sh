#!/bin/sh

if [ -d dist ]; then
   echo
   echo "**********************************************"
   echo 'Removing Angular "dist" folder'
   echo "**********************************************"
   echo
   rm -rf dist
fi

echo
echo "**********************************************"
echo "Create Node container and build Angular"
echo "**********************************************"
echo

docker build -t mikerap/ang-web:build . -f Dockerfile.build

docker create --name tmpbuild mikerap/ang-web:build

docker cp tmpbuild:/ng-app/dist ./dist

docker rm -f tmpbuild

echo
echo "**********************************************"
echo "Build production Angular application in Nginx"
echo "**********************************************"
echo

docker build --no-cache -t mikerap/ang-web:latest .

echo
echo "**********************************************"
echo "Removing mikerap/ang-web:build"
echo "**********************************************"
echo

docker rmi 'mikerap/ang-web:build'
