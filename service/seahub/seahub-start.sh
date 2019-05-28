#!/bin/bash

set -eu

while true
do
  SEAHUB_COUNT=`pgrep -f "seahub" | wc -l`
  if [ ${SEAHUB_COUNT} == 0 ]; then 
       echo "seahub is crashed, try to restart..."
       ${WORK_DIR}/seafile-server-latest/seahub.sh start
  fi
  sleep 10
done
