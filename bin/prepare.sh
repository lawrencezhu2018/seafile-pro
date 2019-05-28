#!/bin/bash
set -eu

DEBIAN_FRONTEND=noninteractive
apt-get update 
apt-get install -y pwgen tcl tk expect openjdk-8-jre poppler-utils libpython2.7 python-pip \
                	python-setuptools python-imaging python-mysqldb python-memcache python-ldap python-urllib3 
#mysqladmin -u root password ${PASSWORD}
pip install boto requests 
ln -sf /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java /usr/bin/ 
apt-get install -y libreoffice libreoffice-script-provider-python poppler-utils 
apt-get install -y ttf-wqy-microhei ttf-wqy-zenhei xfonts-wqy 

apt-get clean  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
