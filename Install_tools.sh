#!/bin/bash

msg=echo -e "$0 at `date` : "
echo -e "$msg Intsalling update if any.....\n"
sleep 3
yum install update -y

echo -e "$msg Installing docker....\n"
sleep 3
yum install docker
echo -e "$msg Enabling and starting docker....\n"
sleep 3
systemctl enable docker
systemctl start docker

echo -e "$msg Getting Kubectl package....\n"
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

echo -e "$msg END of $0"
