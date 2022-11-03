#!/bin/bash

export DOCKER_CONTENT_TRUST=1

imageID="$(docker build -q -t part5:1.15.5 . | awk -F ':' '{print $2}')"
docker run -d -p 80:81 -v nginx:/etc/nginx $imageID

dockle --accept-key=NGINX_GPGKEY part5:1.15.5
