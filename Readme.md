# Vagrantbox Minikube/Grafana/Prometheus

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

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
