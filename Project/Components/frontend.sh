#!/usr/bin/env bash
PRINT "Installing Nginx"
yum install nginx -y
STAT $? "Nginx Installation"

echo "----------------------------------------------------------------------------------------------"
echo -e "\e[1;35m [INFO] Download Frontend Component\e[0m"
echo "----------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------"
echo "----------------------------------------------------------------------------------------------"
# curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
# cd /usr/share/nginx/html
# rm -rf *
# unzip /tmp/frontend.zip
# mv frontend-main/* .
# mv static/* .
# rm -rf frontend-master README.md
# mv localhost.conf /etc/nginx/default.d/roboshop.conf