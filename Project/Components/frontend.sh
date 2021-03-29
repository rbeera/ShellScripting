#!/usr/bin/env bash

yum install nginxcccc -y

if [ $? -ne 0 ]; then
  echo -e "\e[1,31mNginx Installation is failure\e[0m"
  exit 2
fi


curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-master README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf