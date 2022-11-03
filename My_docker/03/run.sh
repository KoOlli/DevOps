#!/bin/bash

spawn-fcgi -p 8080 ./miniserver.fcgi
nginx -g 'daemon off;'
