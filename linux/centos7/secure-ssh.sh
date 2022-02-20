#!/bin/sh
#secure-ssh.sh

#author JoeyTaubert

#creates a new ssh user using $1 parameter
sudo useradd -m -d /home/$1 -s /bin/bash $1
sudo mkdir /home/$1/.ssh

#adds a public key from the local repo or curled from the remote repo
sudo cp /home/joey/tech-journal/SYS265/linux/public-keys/id_rsa.pub /home/$1/.ssh/authorized_keys
sudo chmod 700 /home/$1/.ssh
sudo chmod 600 /home/$1/.ssh/authorized_keys
sudo chown -R $1:$1 /home/$1/.ssh

#removes roots ability to ssh in (ON CENTOS ONLY)
#sudo sed -i "s/PermitRootLogin yes/PermitRootLogin no" /etc/ssh/sshd_config
#sudo systemctl restart sshd

echo "ALL YOUR CODE GOES HERE"
