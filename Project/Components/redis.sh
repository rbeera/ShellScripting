#!/usr/bin/env bash

source Components/common.sh
COMPONENT=redis

OS_Prerequisites

PRINT "setup redis repos"
if [ ! -f /etc/yum.repos.d/remi.repo ]; then
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
STAT $? "Setting up Redis repos"
fi

PRINT "Redis configuration manager"
yum-config-manager --enable remi
yum install redis -y
STAT $? "Install redis"

PRINT "Updating IP in redis configuration file"
sed -i -e '/^bind/ c bind 0.0.0.0' /etc/redis.conf
STAT $? "Update redis configuration file"

PRINT "Start redis service"
systemctl enable redis
systemctl restart redis
STAT $? "Starting Redis service"