# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "mmichal/ubuntu16_04"
  config.vm.box_version = "1.1.20210331"
  config.vm.network "forwarded_port", guest: 80, host: 80, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 443, host: 443, host_ip: "127.0.0.1"
  config.vm.network "private_network", ip: "192.168.123.123"

   config.vm.provider "virtualbox" do |vb|
     vb.gui = false
     vb.memory = "4096"
    end
####################For Minikube Kubernetes####################
config.vm.provision "shell", path: "scripts/install-minikube.sh"
####################Apply configuration####################
config.vm.provision "shell", inline: <<-SHELL
echo "Create Namespace"
sudo kubectl apply -f /vagrant/files/namespace.yaml

echo "Apply configuration for node-exporter"
sudo kubectl apply -f /vagrant/files/node-exporter/node-exporter-pvc-proc.yaml
sudo kubectl apply -f /vagrant/files/node-exporter/node-exporter-pvc-sys.yaml
sudo kubectl apply -f /vagrant/files/node-exporter/node-exporter-pv-proc.yaml
sudo kubectl apply -f /vagrant/files/node-exporter/node-exporter-pv-sys.yaml
sudo kubectl apply -f /vagrant/files/node-exporter/node-exporter-daemonset.yaml
sudo kubectl apply -f /vagrant/files/node-exporter/node-exporter-service.yaml

echo "Apply configuration for node-exporter"
sudo kubectl apply -f /vagrant/files/kube-state-metrics/kube-state-metrics-rbac.yaml
sudo kubectl apply -f /vagrant/files/kube-state-metrics/kube-state-metrics-service.yaml
sudo kubectl apply -f /vagrant/files/kube-state-metrics/kube-state-metrics-deployment.yaml

echo "Apply configuration for prometheus"
sudo kubectl apply -f /vagrant/files/prometheus/configmap-prometheus.yaml
sudo kubectl apply -f /vagrant/files/prometheus/pvc-prometheus.yaml
sudo kubectl apply -f /vagrant/files/prometheus/rbac-prometheus.yaml
sudo kubectl apply -f /vagrant/files/prometheus/prometheus.yaml

echo "Apply configuration for grafana"
sudo kubectl apply -f /vagrant/files/grafana/grafana-pv.yaml
sudo kubectl apply -f /vagrant/files/grafana/grafana-pvc.yaml
sudo kubectl apply -f /vagrant/files/grafana/grafana-service.yaml
sudo kubectl apply -f /vagrant/files/grafana/grafana-deployment.yaml
sudo kubectl apply -f /vagrant/files/grafana/grafana-ingress.yaml

echo "Done !!!"
echo "Open browser and go to http://grafana.minikube.local"
SHELL
end