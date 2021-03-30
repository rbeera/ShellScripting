#!/usr/bin/env bash

LID=lt-092b7f8b625ae423e
LVER=4
aws ec2 run-instances --launch-template LaunchTemplateId=${LID},Version=${LVER} | jq