#!/bin/bash

# Check if the locale is installed
if ! locale -a | grep -q "en_US.UTF-8"; then
    echo "Locale en_US.UTF-8 not found. Installing..."
    sudo apt-get install -y locales
fi

# Set the locale to en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8

# Check if the locale is set correctly
if ! grep -q "LC_ALL=en_US.UTF-8" /etc/environment; then
    echo "Setting LC_ALL to en_US.UTF-8 in /etc/environment"
    echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/environment
fi

# Reload the environment variables
source /etc/environment

# Verify the locale settings
locale
