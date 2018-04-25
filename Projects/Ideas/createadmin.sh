#!/bin/bash
## COPYRIGHT 2018 JAYKE PETERS
## This script will create an admin user with a random password

##Set Variables
USERNAME="admin"
FULLNAME="Administrator"
TIMESTAMP=$(date +"%m%d%y%H%M%S")
LENGTH="6"
PASSWORD=$(/usr/bin/openssl rand -base64 $LENGTH)
PASSWORDFILEPATH="$3/private/tmp/"$(basename $BASH_SOURCE)$TIMESTAMP.log""

# A list of (secondary) groups the user should belong to
# This makes the difference between admin and non-admin users.
# Leave only one uncommented
#SECONDARY_GROUPS="staff"  # for a non-admin user
SECONDARY_GROUPS="admin _lpadmin _appserveradm _appserverusr" # for an admin user

# Check if the script is running as root
if [[ $UID -ne 0 ]]; then echo "Please run $0 as root." && exit 1; fi

# Find out the next available user ID
MAXID=$(dscl . -list /Users UniqueID | awk '{print $2}' | sort -ug | tail -1)
USERID=$((MAXID+1))

## Functions
function createFile {
	/usr/bin/touch $3/private/tmp/"$(basename $BASH_SOURCE)$TIMESTAMP.log"
}

function displayFilepath {
	/bin/echo HIDDEN PASSWORD FILEPATH: $PASSWORDFILEPATH
}

function generatePassword {
	createFile
	/bin/echo $PASSWORD > $PASSWORDFILEPATH
	/bin/echo 'GENERATED PASSWORD: '$PASSWORD''
	/usr/bin/chflags hidden $PASSWORDFILEPATH
	displayFilepath
}

# Generate a random password
generatePassword

# Create the user account
dscl . -create /Users/$USERNAME
dscl . -create /Users/$USERNAME UserShell /bin/bash
dscl . -create /Users/$USERNAME RealName "$FULLNAME"
dscl . -create /Users/$USERNAME UniqueID "$USERID"
dscl . -create /Users/$USERNAME PrimaryGroupID 20
dscl . -create /Users/$USERNAME NFSHomeDirectory /Users/$USERNAME
dscl . -append /Users/$USERNAME Picture "/Library/User Pictures/Flowers/Lotus.tif"
dscl . -passwd /Users/$USERNAME $PASSWORD
dscl . -create /Users/$USERNAME IsHidden 1

# Add user to any specified groups
for GROUP in $SECONDARY_GROUPS ; do
    dseditgroup -o edit -t user -a $USERNAME $GROUP
done

#Create the home directory
createhomedir -c -u $USERNAME

echo "Created user #$USERID: $USERNAME ($FULLNAME)"

