#!/bin/bash
str='^[0-9]+$'
if [[ $1 =~ $str ]] ; then
  echo "error: incorrect parameter" >&2; exit 1
else
  echo "$1"
fi

