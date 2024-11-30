#!/bin/bash

# List all the contents
ls
# List all the contents with dot(.) items
ls -a
# List all the contents with file permissions and others details informations
ls -l
# List all the contents with file permissions and others details informations also with dot(.) items
ls -la
# Moves to the root(/) directory
cd /
# Moves to the current users directory inside home directory
cd
# Moves to the previous directory
cd -
# Moves up one directory level
cd ..
# Moves to the given path directory. Do not forget the forward slash(/) at the beginning
cd /var/log
# List the items in the directory
ls
# Display the path to the bash executable
which bash
# Print the current shell
echo $SHELL
# Creates a new empty directory
sudo mkdir linux_fundamentals
# Creates a new empty file
touch example.txt
# Copy the file to new directory
cd linux_fundamentals
sudo mkdir scripts
sudo mkdir backup
cd ..
cp example.txt scripts/
# Move the file to new directory
mv example.txt backup/
# List the files inside subdirectory
ls backup/
cd backup
# Change the permission of the file
# 4 = read, 2 = write, 1 = executable, 0 = No
# So 6 means read and write(4+2), 4 means readonly
# 1st part 6 is for the user, 2nd part 4 is for group and 3rd part is for others
chmod 644 example.txt
# Add new user student
sudo useradd student
# Set password for the user student
sudo passwd student
# View details of the user student. See all the users by cat /etc/passwd.
# Then pipe(|) grep to search the user matches the keyword student
cat /etc/passwd | grep student
# Add new group students
sudo groupadd students
# Change the owner of the file example.txt to student
sudo chown student example.txt
# Change the group owner of the file example.txt to students
sudo chgrp students example.txt
# Show the current folder path
pwd
# Give permission to the report.txt file
sudo mkdir project
touch project/report.txt
cd project
chmod 644 report.txt
# Give permission to the project folder\
cd ..
chmod 755 project
ls -l | grep project
# Create a new directory developer_home inside home directory
sudo mkdir /home/developer_home
# Set the home directory of the user developer to developer_home
sudo usermod -d /home/developer_home -m developer
# Assign the shell /bin/sh to the user developer
sudo usermod -s /bin/sh developer
# Change the username of the user developer to devuser.
sudo usermod -l devuser developer
# Create a softlink of the file original.txt
cd ..
touch original.txt
cd project
ln -s ../original.txt softlink.txt
# Create a hardlink of the file datafile.txt
cd ..
touch datafile.txt
cd project
ln ../datafile.txt hardlink.txt
# Show the inode of a file
ls -i hardlink.txt
# Find all the .txt files in the current directory
find . -name "*.txt"
# Update repo cache
sudo apt update
# Install the package tree
sudo apt install tree
# gloud CLI installations
sudo apt-get update
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

sudo apt-get update && sudo apt-get install google-cloud-cli