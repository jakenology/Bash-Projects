#!/bin/bash
## COPYRIGHT 2018 JAYKE PETERS
## MAC SETUP SCRIPT

## SET VARIABLES
LOCALBIN="/usr/local/bin"
WORKDIR=`dirname $0`
MACHD=`$3`

## Functions
function bypassSetup {
	# BYPASS APPLE'S SETUP ASSISTANT UPON REBOOT
}

function installTools {

}

function createAdmin {
	# CREATE A LOCAL ADMIN USER WITH A RANDOM PASSWORD
	/usr/local/bin/JPITS/createAdmin
}

function powerChime {
	# ENABLE CHARGER PLUG-IN CHIME
	/usr/bin/defaults write com.apple.PowerChime ChimeOnAllHardware -bool true; /usr/bin/open /System/Library/CoreServices/PowerChime.app &
}

function moveResources {

}



function installApps {

}

function makeResourcesAlias {

}

function hideRoot {
	# HIDE THE ROOT USER
	/usr/bin/defaults write /Library/Preferences/com.apple.loginwindow SHOWOTHERUSERS_MANAGED -bool FALSE
}

function disableTrashWarning {
	# DISABLE EMPTY TRASH WARNING
	/usr/bin/defaults write com.apple.finder WarnOnEmptyTrash 1
}

function resetLaunchpad {
	# RESET ALL USER'S LAUNCHPAD
}
