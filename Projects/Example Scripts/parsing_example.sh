#!/bin/bash
## Copyright 2018 Jayke Peters
## First Boot/First Login Mac Setup Script 

## Grab passed arguments
args=("$@")

## If argument is equal to disablePhotos, then proceed
#if [[ ${args[0]} == "skipphotos"]]; then
    #skipphotos="true"
#fi
#for file in '$3/Users/*/Library/Preferences/ByHost/com.apple.ImageCapture'; do
    #/usr/bin/defaults -currenthost write $file disableHotPlug -bool NO
#done

## Functions
function normalSetup {
    other2
}

function other2 {
    if [[ $disbatch == "true" ]]; then
        say hello
    fi
}

## Evaluate command-line arguments
if [[ $# =  0 ]]; then
    normalSetup
else
    while [[ $# > 0 ]]
    do
    case "$1" in
        --disablebatchime|-disbatch)
        disbatch=true
            ;;
        --opt2) echo "option 2"
            ;;
        --*) echo "bad option $1"
            ;;
        *) echo "argument $1"
            ;;
    esac
    shift
    done
    normalSetup
fi

exit 0