#!/bin/bash

USERNAME=$1
PASSWORD=$2
PORT=$3

if [ -z "$USERNAME" ] || [ -z "$PASSWORD" ] || [ -z "$PORT" ]; then
    echo "Usage: $0 <username> <password> <port>"
    exit 1
fi

docker run -d --name user_container_$USERNAME -p $PORT:22 feztix/jenkins-essential-image /bin/bash -c "useradd -m -d /home/$USERNAME -s /bin/bash $USERNAME && echo '$USERNAME:$PASSWORD' | chpasswd && sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config && sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config && /usr/sbin/sshd -D"

