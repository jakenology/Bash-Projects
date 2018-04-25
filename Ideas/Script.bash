#!/bin/bash

## Set Variables
args=("$@")

## Print Arguments
echo ${args[0]}

if [[ ${args[0]} == "Jayke" ]]; then
	say hi
fi