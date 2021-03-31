#!/usr/bin/env bash
USER_ID=$(id -u)
if [ "${USER_ID}" -ne 0 ]; then
  echo -e "\e[1;31mYou should be root user to perform this command\e[0m"
  exit 1
fi

set-hostname ${COMPONENT}
disable-auto-shutdown

PRINT() {
  echo "----------------------------------------------------------------------------------------------"
  echo -e "\e[1;35m [INFO] $1\e[0m"
  echo "----------------------------------------------------------------------------------------------"
}

STAT() {
  if [ $1 -ne 0 ]; then
    echo "----------------------------------------------------------------------------------------------"
    echo -e "\e[1;31m [ERROR] $2 is failure\e[0m"
    echo "----------------------------------------------------------------------------------------------"
    exit 2
  else
    echo "----------------------------------------------------------------------------------------------"
    echo -e "\e[1;32m [SUCC] $2 is success\e[0m"
    echo "----------------------------------------------------------------------------------------------"
fi
}

NodeJS_Install() {
  PRINT "Install nodejs"
  yum install nodejs make gcc-c++ -y
  STAT $? "Installing NodeJS"
}

Roboshop_Add_App_User() {
  id roboshop
  if [ $? -eq 0 ]; then
    PRINT "Create Roboshop User - User already exists"
    return
  fi
  PRINT "Create app user"
  useradd roboshop
  STAT $? "Creating app user"
}