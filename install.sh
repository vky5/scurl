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


# Define arrays for Debian-based and RHEL-based OS
# Please add os if you ur os is of similar type
debian=("ubuntu" "debian" "kali")
rhel=("fedora" "centos" "rhel")

os=""

# Check for Debian-based OS
for os_type in "${debian[@]}"
do
    if [[ "$os_name" == *"$os_type"* ]]; then
        echo "Debian-based OS detected: $os_name"
        os="debian"
        break
    fi
done

# Check for RHEL-based OS
for os_type in "${rhel[@]}"
do
    if [[ "$os_name" == *"$os_type"* ]]; then
        echo "RHEL-based OS detected: $os_name"
        os="rhel"
        break
    fi
done

# If OS is not recognized, exit the script
if [[ $os == "" ]]; then 
    echo "Unknown OS. Please update the install script manually."
    exit 1
fi

# Run the appropriate installation script based on the detected OS
if [[ $os == "debian" ]]; then
    echo "Running Debian-based installation script..."
    ./ins_deb.sh  # Run Debian-specific install script
elif [[ $os == "rhel" ]]; then
    echo "Running RHEL-based installation script..."
    ./ins_rhel.sh  # Run RHEL-specific install script
fi

echo "Installation complete!"