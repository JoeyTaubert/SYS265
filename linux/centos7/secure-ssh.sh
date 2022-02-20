#!/bin/sh
#secure-ssh.sh
#author gmcyber

#creates a new ssh user using $1 parameter
read $1
useradd -G wheel $1 
echo "Creating SSH user $1"
echo "AllowUsers $1" >> /etc/ssh/sshd_config
 
#adds a public key from the local repo or curled from the remote repo
key=cat "/home/joey/SYS265/linux/public-keys/id_rsa.pub"
echo $key > /etc/ssh/ssh_config

#removes roots ability to ssh in
sed -i "s/PermitRootLogin yes/PermitRootLogin no" /etc/ssh/sshd_config
systemctl restart sshd

echo "ALL YOUR CODE GOES HERE"
