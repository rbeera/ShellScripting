#!/usr/bin/env bash

# Variable is name you give to certain set of data
## Without Variables

echo Welcome to DevOps training
echo Training of DevOps lasts for 70 days
echo "DevOps training covers shell scripting & Ansible"

## Declaring a variable , Syntax: var = data

COURSE=Linux
echo Welcome to ${COURSE} training
echo Training of $COURSE lasts for 70 days
echo "$COURSE training covers shell scripting & Ansible"

## Variables usually holds a data which varies from time to time
a=100
fruit=Apple
echo $fruit is $ano
echo $fruit is ${a}no