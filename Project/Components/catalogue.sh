#!/usr/bin/env bash

PRINT "Install nodejs"
yum install nodejs make gcc-c++ -y
STAT $? "Installing nodejs"

PRINT "Create app user"
useradd roboshop
STAT $? "Creating app user"

PRINT "Download Catalogue"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
STAT $? "Downloading Catalogue component"

PRINT "Extract Catalogue"
cd /home/roboshop
rm -rf catalogue && unzip /tmp/catalogue.zip && mv catalogue-main catalogue
STAT $? "Extracting Catalogue"

PRINT "Download nodejs dependencies"
cd /home/roboshop/catalogue
npm install
STAT $? "Downloading Dependencies"

# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl start catalogue
# systemctl enable catalogue

