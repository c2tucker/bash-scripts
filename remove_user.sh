#!/bin/bash

#Purpose: Safely remove a user account from the system
# Date: 6/22/2026
# Usage: ./remove_user.sh <username>

if [ -z "$1" ];  then
   echo "Usage: ./remove_user.sh <username>"
   exit 1
fi

USERNAME=$1

if ! id "$USERNAME" &>/dev/null; then
   echo "Error: User '$USERNAME' does not exist."
   exit 1
fi

if [ "$USERNAME" = "root" ] || [ "$USERNAME" = "$USER" ]; then
   echo "Error: Cannot delete root or the current logged in user."
   exit 1
fi

echo "WARNING: You are about to delete user '$USERNAME' and their home directory."
read -p "Are you sure? (yes/no): " CONFIRM

if [ "$CONFIRM" != "yes" ]; then
   echo "Cancelled. No changes were made."
   exit 0
fi

sudo userdel -r $USERNAME

echo ""
echo "===================="
echo "  User removed successfully!"
echo "  Username:  $USERNAME"
echo "  Home directory deleted."
echo "===================="

