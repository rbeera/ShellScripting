#!/usr/bin/env bash

## Determine a function

function abc() {
  echo "Welcome to abc function"
}

xyz () {
  echo "Welcome to xyz function"
}

## call the function
abc
xyz
abc

print_value () {
  echo "Input value is $1"
}

print_value 10
print_value 20
print_value 30
print_value 100

