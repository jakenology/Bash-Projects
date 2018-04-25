#!/bin/bash

## Grab Passed Arguments
args=("$@")

## If argument = this, then that
## if it equals this, then do that function and its passed parameters and shift so that the array is 0 for $1, 1 for $2, etc
if [[ ${args[0]} == "Jayke" ]]; then
	say hi
fi