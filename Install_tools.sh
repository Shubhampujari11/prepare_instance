#!/bin/bash

msg=`date`

echo -e "THIS is the new line i have added today on `date`"

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



echo -e "$msg Make the kubectl binary executable:\n"
chmod +x ./kubectl

echo -e "$msg Move the binary in to your PATH:\n"
mv ./kubectl /usr/local/bin/kubectl

echo -e "$msg Check version:\n"
kubectl version --client

echo -e "$msg Minikube install:\n"

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
&& chmod +x minikube \
&& sudo mv minikube /usr/local/bin/

minikube version

echo -e "$msg Start minikube with docker driver"

minikube start --driver=docker --force

echo -e "$msg  Check status:"
minikube status
kubectl get pods
kubectl get svc


echo -e "$msg END of $0"
