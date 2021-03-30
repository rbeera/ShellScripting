#!/usr/bin/env bash

LID=lt-092b7f8b625ae423e
LVER=4
COMPONENT=$1

if [ -z "${COMPONENT}" ]; then
  echo "Component Name Input is needed"
  exit 1
fi

aws ec2 run-instances --launch-template LaunchTemplateId=${LID},Version=${LVER} --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}]" | jq