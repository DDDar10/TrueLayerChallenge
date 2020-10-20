#!/bin/bash

# TrueLayer Senior IT Engineer Challenge Dario Dusil 

# Creates a folder in your home directory called TrueLayer
if [ ! -d ~/TrueLayer ]; then mkdir ~/TrueLayer; fi

# Creates a file in the TrueLayer folder called TLTest.txt
FILENAME=~/TrueLayer/TLTest.txt
if [ ! -f $FILENAME ]; then touch "$FILENAME"; fi

# Redirects stdout to our file:
exec >> $FILENAME

# If the script is run multiple times, it shouldn't fail and has to append all the information in the file, separating each run with a comment.
printf "\n######################################## SEPARATOR  ########################################\n"

# The time when the script has been run.
printf "%s %s\n" "The time when the script has been run:" "$(date)"

# The name of the script file.
printf "%s %s\n" "The name of the script file:" $0

# The public IP the machine uses to reach internet.
printf "The public IP the machine uses to reach internet: %s\n" "$(dig +short myip.opendns.com @resolver1.opendns.com)" 

# the RAM available in MB (total amount of physical RAM).
printf "The RAM available in MB (total amount of physical RAM): %d MB\n" $(expr $(sysctl -n hw.memsize) / 1024 / 1024)

# The PID and the name of the user that is executing the script.
printf "The PID and the name of the user that is executing the script:\tPID: %s\tUSER: %s\n" $(ps -o pid,user,command | grep -m1 $0 | awk '{print $1}') $USER

# The full list of every file and folder name present in the running folder. (moved to end for clarity)
printf "The full list of every file and folder name present in the running folder:\n" 
ls -aF

