#!/bin/bash
num=0
s=$1
while true;
do num+=$s
echo -n "${num:}";
exit;
done;