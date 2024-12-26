#!/bin/bash
# Searches system for user files and archives them to /tmp/


read -p "Enter the username: " username

# Check if the user exists
if ! id "$username" &>/dev/null; then
  echo "User '$username' does not exist."
  exit 1
fi

archive_file="/tmp/${username}_files.tar.gz"

echo "Archiving files owned by '$username'..."
sudo find / -user "$username" -print0 | sudo tar --null -cvzf "$archive_file" --files-from=-

if [ -f "$archive_file" ]; then
  echo "Files owned by '$username' have been archived to $archive_file."
else
  echo "Failed to create archive."
fi