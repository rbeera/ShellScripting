#!/usr/bin/env bash

source Components/common.sh
COMPONENT=mysql
OS_Prerequisites

PRINT "Setting up mysql Repos"
echo '[mysql57-community]
name=MySQL 5.7 Community Server
baseurl=http://repo.mysql.com/yum/mysql-5.7-community/el/7/$basearch/
enabled=1
gpgcheck=0' > /etc/yum.repos.d/mysql.repo
STAT $? "mysql repos setting"

PRINT "Install mysql"
Install MySQL
yum remove mariadb-libs -y
yum install mysql-community-server -y
STAT $? "Installing mysql"

PRINT "start mysql service"
systemctl enable mysqld
systemctl start mysqld
STAT $? "starting mysql service"

PRINT "Change default password"
echo show databases | mysql - uroot -pRoboShop@123
if [ $? -ne 0 ]; then
    DEFAULT_PASSWORD=$(grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}')
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'RoboShop@123';
  uninstall plugin validate_password;" >/tmp/sql
    mysql --connect-expired-password -u root -p"${DEFAULT_PASSWORD}" </tmp/sql
    STAT $? "Changing MySQL Default password"
  else
    PRINT "MySQL Password reset is not required"
  fi

Download_Component_From_GitHub
Extract_Component_to_tmp

PRINT "Load mysql schema"
  cd /tmp/mysql-main
  mysql -u root -pRoboShop@123 <shipping.sql
STAT $? "Loading schemas"