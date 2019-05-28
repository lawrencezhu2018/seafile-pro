#!/bin/bash

set -eu

while true
do
   SEAFILE_COUNT=`pgrep -f seafile-controller | wc -l`
   if [ ${SEAFILE_COUNT} == 0 ]; then       
        echo "seafile is crashed, try to restart..."
        ${WORK_DIR}/seafile-server-latest/seafile.sh start
   fi
   sleep 10
done
