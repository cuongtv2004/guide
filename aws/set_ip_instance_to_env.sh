#!/bin/bash

# $1 Region

sh aws.sh front > list_front_ip

x=0
cat list_front_ip | while read line; do
  x=$(( x+1 ))
  `sed -i ''$x's/'.*'/export FRONT_IP_'$x'='${line}'/' .env`
done
