#!/bin/bash

# Starting initial setup
echo "Starting initial setup"

# Adding User
echo "<--------------- Adding User --------------->"
echo "Adding user 'scurl' with no login shell..."
useradd --shell /sbin/nologin scurl
echo "User 'scurl' added successfully."

# Creating Directories
echo "<--------------- Creating Directories --------------->"
echo "Creating directories /opt/scurl and /var/log/scurl..."
mkdir -p /opt/scurl           # Directory where scurl script files will be stored
mkdir -p /var/log/scurl       # Directory where logs will be saved
echo "Directories created successfully."

# Copying Files
echo "<--------------- Copying Files --------------->"
echo "Copying all files from current directory to /opt/scurl..."
cp -r * /opt/scurl
echo "Files copied successfully."

# Setting Ownership
echo "<--------------- Setting Ownership --------------->"
echo "Changing ownership of /opt/scurl and /var/log/scurl to user 'scurl'..."
chown -R scurl:scurl /opt/scurl
chown -R scurl:scurl /var/log/scurl
echo "Ownership set successfully."

# Setting up Systemd Service
echo "<--------------- Setting up Systemd Service --------------->"
echo "Creating systemd service file for scurl..."
touch /etc/systemd/system/scurl.service

# Copy scurl.service to the systemd directory
cp /opt/scurl/service/scurl.service  /etc/systemd/system/scurl.service
echo "Systemd service file created successfully."

# Set permissions on the systemd service file
chmod 644 /etc/systemd/system/scurl.service
echo "Permissions set for the systemd service file."

# Reloading systemd and Starting Service
echo "<--------------- Reloading systemd and Starting Service --------------->"
echo "Reloading systemd to recognize the new service..."
systemctl daemon-reload
echo "Systemd daemon reloaded successfully."

echo "Starting the scurl service..."
systemctl start scurl
echo "Scurl service started successfully."

# Enable the service to start on boot
echo "Enabling scurl service to start on boot..."
systemctl enable scurl
echo "Scurl service enabled to start on boot."

# Final Confirmation
echo "Setup complete! scurl is now running."
