#!/usr/bin/env bash
source Components/common.sh
COMPONENT=catalogue

NodeJS_Install
Roboshop_Add_App_User
Download_Component_From_GitHub
Extract_Component
Install_NodeJS_Dependencies



# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl start catalogue
# systemctl enable catalogue

