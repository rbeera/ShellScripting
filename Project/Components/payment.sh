#!/usr/bin/env bash

source Components/common.sh
COMPONENT=payment

OS_Prerequisites

PRINT "Install Python 3"
yum install python36 gcc python3-devel -y
STAT $? "Installing Python"
Roboshop_Add_App_User
Download_Component_From_GitHub
Extract_Component

PRINT "Install the dependencies"
cd /home/roboshop/payment
pip3 install -r requirements.txt
STAT $? "Installing dependencies"