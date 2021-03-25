#!/usr/bin/env bash

echo Hello World
echo Welcome to DevOps practice


echo -e "Hello\nWorld"
echo -e "Hello\n\nWorld"

#color based printing
# Colors      Code

# Red         31
# Green       32
# Yellow      33
# Blue        34
# Magenta     35
# Cyan        36

# Reset       0
# Bold        1

# Syntax: echo -e "\e[COLCODEmMESSAGE"

echo -e "\e[31mHello in Red"
echo -e "\e[1;31mHello in Bold Red"