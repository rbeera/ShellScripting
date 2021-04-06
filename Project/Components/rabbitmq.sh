#!/usr/bin/env bash

source Components/common.sh
COMPONENT=rabbitmq

OS_Prerequisites

PRINT " Install erlang"
yum list installed | grep erlang
if [ $? ne 0 ]; then
  yum install https://github.com/rabbitmq/erlang-rpm/releases/download/v23.2.6/erlang-23.2.6-1.el7.x86_64.rpm -y
  STAT $? "Installing erlang"
fi

PRINT "Setup YUM repositories for RabbitMQ."
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash
STAT $? "Setting up yum repos"

PRINT "Install RabbitMQ"
yum install rabbitmq-server -y
STAT $? "Installing RabbitMQ"

PRINT "Start RabbitMQ"
systemctl enable rabbitmq-server
systemctl start rabbitmq-server
STAT $? "Starting RabbitMQ service"

PRINT "Create application user"
rabbitmqctl add_user roboshop roboshop123 && rabbitmqctl set_user_tags roboshop administrator && rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
STAT $? "Creating RabbitMQ app user"