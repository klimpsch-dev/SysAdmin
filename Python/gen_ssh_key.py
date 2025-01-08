import os
import subprocess

# Ask for key type in a while loop to ensure valid input
key_type = ''
while key_type not in ['1', '2', '3']:
    print("Select the type of SSH key to generate:")
    print("1) RSA (2048-bit)")
    print("2) RSA (4096-bit)")
    print("3) Ed25519 (stronger, modern)")
    key_type = input("Enter your choice (1-3): ")
    if key_type not in ['1', '2', '3']:
        print("Invalid choice. Please enter 1, 2, or 3.")

if key_type == '1':
    key_type = 'rsa'
    key_bits = '2048'
elif key_type == '2':
    key_type = 'rsa'
    key_bits = '4096'
elif key_type == '3':
    key_type = 'ed25519'
    key_bits = ''

# Ask for the key file location
file_path = input(f"Enter the file path to save the key (or press enter to use default ~/.ssh/id_{key_type}): ")
if not file_path:
    file_path = os.path.expanduser(f"~/.ssh/id_{key_type}")

# Ask for passphrase (optional)
passphrase = input("Enter a passphrase or Press enter: ")

# Prepare ssh-keygen command
command = ['ssh-keygen', '-t', key_type, '-f', file_path]
if key_bits:
    command += ['-b', key_bits]
if passphrase:
    command += ['-N', passphrase]
else:
    command += ['-N', '']

# Generate the SSH key using subprocess
subprocess.run(command)

print(f"SSH key generated successfully!\nPublic key: {file_path}.pub")