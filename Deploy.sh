#!/bin/bash

# installing kubeadm,kubectl,kubelet
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

#docker

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh


#Resolving container runtime errors:

sudo rm /etc/containerd/config.toml
sudo systemctl restart containerd


#Create cluster:

sudo kubeadm init --pod-network-cidr=10.244.0.0/16

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


#if you are deploying on a single node cluster
kubectl apply -f https://raw.githubusercontent.com/flannel-io/flannel/master/Documentation/kube-flannel.yml
kubectl taint nodes --all node-role.kubernetes.io/control-plane- node-role.kubernetes.io/master-


#INSTALL HELM
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm

#EMCO setup


#Add EMCO's official Helm repository:

helm repo add emco https://gitlab.com/api/v4/projects/29353813/packages/helm/stable
helm repo update

kubectl create namespace emco
helm install emco -n emco emco/emco \
  --set global.db.emcoPassword=SETPASS \
  --set global.db.rootPassword=SETPASS \
  --set global.contextdb.rootPassword=SETPASS \
  --set global.emcoTag=22.06


