#!/bin/bash


# even tho I don't like running scripts with sudo permission but for creating the scurl user and setting up the permission, I need to do it
if [[ "$(id -u)" -ne 0]]
then
    echo "Please run the script with sudo."
    exit 1
fi
# output=$(echo "/etc/os-release") # this file always contain the name of the os
os_name=$(echo "/etc/os-release" | grep '^NAME=' | cut -d'=' -f2 | tr -d '"') 
# okay to get the os_name what I did was first echo the file that contains the os info 
# using grep find where line where the first words are name it can be anything name_aver name_s or but os-release file doesnt contain things like that seems unnecessary but cool
# cut -d'=' -f2 okay so cut is used to separate using dilimitor = and select -f2 from it 
# tr -d '"' I am just deleting the double quote so it wont show "Ubuntu" instead show ubuntu can use double quote if need be later 


# please add name here if you want to
debian=("ubuntu" "debian" "kali")
rhel=("fedora" "centos")

os=""

## first checking for debian os
for os in debian
do
    tmp=$(grep "$os")

    if [[ tmp ]]
    then
        echo "os detected"
        os="debian"
        break
    fi
done


## first checking for rhel os
for os in rhel
do
    tmp=$(grep "$os")

    if [[ tmp ]]
    then
        echo "os detected"
        os="rhel"
        break
    fi
done


if [[ $os == "" ]]
then 
    echo "not know os. Update install file manually"
    exit 1
fi






