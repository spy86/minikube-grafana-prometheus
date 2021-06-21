#!/bin/bash

sudo apt update
sudo apt install snapd -y
# snap install kubectl --classic
snap install microk8s --classic
microk8s.status --wait-ready
microk8s.enable dns dashboard registry
# microk8s.kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/mandatory.yaml
microk8s.enable ingress
snap alias microk8s.kubectl kubectl
usermod -a -G microk8s vagrant
echo "alias mk='/snap/bin/microk8s'" >> /home/vagrant/.bash_aliases
echo "alias kc='/snap/bin/kubectl'" >> /home/vagrant/.bash_aliases
chown vagrant:vagrant /home/vagrant/.bash_aliases
sudo -H -u vagrant sh -c 'mkdir ~/.kube && microk8s.kubectl config view --raw > ~/.kube/config'
kubectl version --short  
# Install Helm
# snap install helm --classic
# helm version
# helm repo add stable https://kubernetes-charts.storage.googleapis.com/
# helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com
# helm repo add bitnami https://charts.bitnami.com/bitnami
# helm repo update

microk8s.config > /home/vagrant/.kube/config
chown vagrant:vagrant /home/vagrant/.kube/config
chmod 600 /home/vagrant/.kube/config