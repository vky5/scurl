#!/bin/bash

# Start Scurl application in the background, redirecting output to /dev/null
cd /opt/scurl || exit 1
nohup ./scurl.sh &> /dev/null &

# nohup stands for no hang up and it is used for the used to run a command in the background and prevent it from being terminated when the user logs out or closes the terminal.


