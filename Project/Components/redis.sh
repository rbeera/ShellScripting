#!/usr/bin/env bash

source Components/common.sh
COMPONENT=redis

OS_Prerequisites

PRINT "setup redis repos"
yum install epel-release yum-utils -y
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
STAT $? "Setting up Redis repos"

PRINT "Redis configuration manager"
# yum-config-manager --enable remi
# yum install redis -y
Update the BindIP from 127.0.0.1 to 0.0.0.0 in config file /etc/redis.conf

Start Redis Database
# systemctl enable redis
# systemctl start redis