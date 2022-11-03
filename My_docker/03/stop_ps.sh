#!/bin/bash

docker stop $(docker ps -a -q)

./quest5.sh