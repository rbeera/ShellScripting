#!/usr/bin/env bash
SOURCE Components/common.sh

PRINT "Installing Nginx"
yum install nginx -y
STAT $? "Nginx Installation"

exit

PRINT "Download Frontend Component"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
STAT $? "Download Frontend"

PRINT "Extract Frontend"
cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
STAT $? "Extracting Frontend"

mv frontend-main/* .
mv static/* .
rm -rf frontend-master README.md

PRINT "Nginx Configuration Update"
mv localhost.conf /etc/nginx/default.d/roboshop.conf
STAT $? "Nginx Configuration Updating"

PRINT " Nginx Enabling"
systemctl enable nginx
systenctl restart nginx
STAT $? " Nginx restarting"
