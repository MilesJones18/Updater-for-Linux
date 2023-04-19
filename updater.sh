#!/bin/bash



GREEN="\033[1;32m" # This is shell color code.

RED="\033[1;31m"

BLUE="\033[1;34m"

NOCOLOR="\033[0m"



# Stores the start time in seconds.

start=$(date +"%s") 



# Current_date prints the current date and time in red at the start of the script

current_date () {

  	today=$(date +"%m-%d-%y")

  	echo "${RED}\nToday's date: $today "



  	current_time=$(date +"%H:%M:%S %p")

  	echo "The current time: $current_time\n${NOCOLOR}"

}





# Sets up the framework of how the script will print the step numbers and messages.

log () { 

	STEP=$1 # Stores the first command line argument in the STEP variable.

	MSG=$2 # Stores the second in the MSG variable.



	echo "Step $STEP: ${GREEN}${MSG}${NOCOLOR}"

}



# Calls the current_date function.

current_date



echo # Adds a space in-between the two functions when it prints.



# Runs the first update command, && is a command that exits the script if the apt-get command fails.

log 1 "Updating..."

sudo apt-get update &&



echo



log 2 "Upgrading..."

sudo apt-get upgrade &&



echo



log 3 "Getting distribution upgrades..."

sudo apt-get dist-upgrade &&



echo



log 4 "Removing unused packages..."

sudo apt-get --purge autoremove # Removes unused and bloated files.



echo



log 5 "Cleaning up..."

sudo apt-get autoclean



echo



end=$(date +"%s") # Stores the endtime in seconds.

runTime=$((end-start)) # Gets the difference between the two variables and stores it in runTime.



echo "${RED}That took $runTime seconds${NOCOLOR}"
