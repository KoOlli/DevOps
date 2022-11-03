#!/bin/bash

docker stop $(docker ps -a -q)


imageID="$(docker build -q -t part4:1.15.5 . | awk -F ':' '{print $2}')"
docker run -d -p 80:81 -v nginx:/etc/nginx $imageID

