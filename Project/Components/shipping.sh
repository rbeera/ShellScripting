#!/usr/bin/env bash

source Components/common.sh
COMPONENT=shipping
OS_Prerequisites

PRINT "Install Maven"
yum install maven -y
STAT $? "Installing Maven"

Roboshop_Add_App_User
Download_Component_From_GitHub
Extract_Component

PRINT "Compile Shipping Code"
cd /home/roboshop/shipping
mvn clean package && mv target/shipping-1.0.jar shipping.jar
STAT $? "Compling code"

Setup_Service
