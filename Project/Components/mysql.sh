#!/usr/bin/env bash

source Components/common.sh
COMPONENT=cart

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
Start MySQL.
systemctl enable mysqld
systemctl start mysqld
STAT "starting mysql service"

grep temp /var/log/mysqld.log

# mysql_secure_installation


# mysql -u root -p

#Run the following SQL commands to remove the password policy.
#> uninstall plugin validate_password;
#> ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';