#!/bin/bash

# Stop the Scurl application by killing the running process
pid=$(ps aux | grep 'scurl.sh' | grep -v 'grep' | awk '{print $2}') # get the PID and kill the process simple
if [[ -n "$pid" ]]; then # here -n checks if the string passed is not empty
    kill -9 "$pid" &> /dev/null # shouldnt have force killed it but there are no child processes that this will start so no problem with that
fi
