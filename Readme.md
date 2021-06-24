# Vagrantbox Minikube/Grafana/Prometheus
![GitHub issues](https://img.shields.io/github/issues/spy86/minikube-grafana-prometheus) ![GitHub forks](https://img.shields.io/github/forks/spy86/minikube-grafana-prometheus) ![GitHub stars](https://img.shields.io/github/stars/spy86/minikube-grafana-prometheus) ![GitHub](https://img.shields.io/github/license/spy86/minikube-grafana-prometheus) 


## Prerequisites
* Vagrant - https://www.vagrantup.com/downloads
* Virtualbox - https://www.virtualbox.org/wiki/Downloads

## How to use?

1. Clone https://github.com/spy86/minikube-grafana-prometheus
2. Run `vagrant up` from terminal and wait while virtual machine is installed.
3. Add the following line to the hosts file `192.168.123.123 grafana.minikube.local`
4. Open http://grafana.minikube.local in web browser
5. Login: `admin` Password: `admin`
6. Add Prometheus datasource
7. Import dashboard https://grafana.com/grafana/dashboards/8685