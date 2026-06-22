#!/bin/bash

# Purpose: Automate user creation on Linux
# Date: 6/21/2026
# Usage: ./create_user.sh <username>

if [ -z "$1" ]; then
   echo "Usage: ./create_user.sh <username>"
   exit 1
fi

USERNAME=$1

sudo useradd -m $USERNAME

sudo passwd $USERNAME

sudo usermod -aG sudo $USERNAME

echo ""
echo "===================="
echo "  User created successfully!"
echo "  Username:  $USERNAME"
echo "  Home:      /home/$USERNAME"
echo "  Group:     sudo"
echo "===================="

