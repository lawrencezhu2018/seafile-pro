#!/bin/bash
#This script is used to execute install mysql and seafile.

set -eu

cd ${WORK_DIR}/seafile-pro-server-${SEAFILE_VERSION}

apt-get update >/dev/null
apt-get install -y mysql-server
service mysql restart

./setup-seafile-mysql.sh
./seafile.sh start
./seahub.sh start

apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
