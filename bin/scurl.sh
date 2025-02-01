#!/bin/bash


# Scurl stands for simplified curl that is an abstraction over curl to provide easier access to curl and 

# Default value

method="GET"
url=""



if [[$# -gt 0]]
then
    if [[ $1 == "-X"]]
    then 
        method="$2"
else 
    curl -X $method $2


