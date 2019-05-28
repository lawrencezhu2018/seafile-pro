#!/bin/bash

set -eu

while true
do
    MYSQL_COUNT=`pgrep -f mysqld | wc -l`
    if [ ${MYSQL_COUNT} == 0 ]; then 
          echo "mysql is crashed, try to restart..."
          service mysql start
    fi
    sleep 10
done
