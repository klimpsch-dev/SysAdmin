#!/bin/bash
# Creates a user with private group as primary, with optional secondary

group_exists() {
  getent group "$1" > /dev/null 2>&1
}

user_exists() {
  getent passwd "$1" > /dev/null 2>&1
}



read -p "Enter the username: " username

# Check if user already exists
if user_exists "$username"; then
  echo "User '$username' already exists."
  exit 1
fi

echo "Creating user '$username' with a private group..."
sudo useradd -m -U "$username"

read -p "Enter additional groups (comma separated) or press Enter to skip: " groups


# if valid at user to group
if [ -n "$groups" ]; then
  IFS=',' read -ra group_list <<< "$groups"
  for group in "${group_list[@]}"; do
    if group_exists "$group"; then
      echo "Adding user '$username' to group '$group'..."
      sudo usermod -aG "$group" "$username"
    else
      echo "Group '$group' does not exist. Please create it first."
    fi
  done
fi

echo "User '$username' has been created."
echo "User and group information:"
id "$username"