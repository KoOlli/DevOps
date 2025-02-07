#!/bin/bash

print "$(goaccess ../04/nginx_log_*.log --log-format=COMBINED --date-format=%d/%b/%Y --time-format=%T)"
