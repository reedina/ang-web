#!/bin/sh
echo
echo "**********************************************"
echo Create Node container and build Angular
echo "**********************************************"
echo

docker build -t mikerap/ang-test:build . -f Dockerfile.build

docker create --name tmpbuild mikerap/ang-test:build

docker cp tmpbuild:/ng-app/dist ./dist

docker rm -f tmpbuild

echo
echo "**********************************************"
echo Build production Angular application in Nginx
echo "**********************************************"
echo

docker build --no-cache -t mikerap/ang-test:latest .

echo
echo "**********************************************"
echo Removing mikerap/ang-test:build
echo "**********************************************"
echo

docker rmi 'mikerap/ang-test:build'
