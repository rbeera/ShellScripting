#!/usr/bin/env bash
source Components/common.sh
COMPONENT=catalogue

NodeJS_Install
Roboshop_Add_App_User


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

