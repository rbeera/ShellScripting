#!/usr/bin/env bash
USER_ID=$(id -u)
if [ "${USER_ID}" -ne 0 ]; then
  echo -e "\e[1;31mYou should be root user to perform this command\e[0m"
  exit 1
fi
