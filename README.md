## k8s-LFS258

Why do we need to disable swap?



* curl 
* apt-transport-https 
* vim 
* git 
* wget 
* gnupg2 
* software-properties-common 
* lsb-release 
* ca-certificates 
* uidmap

Deciding which pod network to use for Container Networking Interface (CNI) should take into account the expected
demands on the cluster. There can be only one pod network per cluster, although the CNI-Genie project is trying to
change this.
The network must allow container-to-container, pod-to-pod, pod-to-service, and external-to-service communications.
We will use Calico as a network plugin which will allow us to use Network Policies later in the course. Currently
Calico does not deploy using CNI by default. Newer versions of Calico have included RBAC in the main file. Once
downloaded look for the expected IPV4 range for containers to use in the configuration file.
The Cilium network plugin is becoming popular, and has lots of options including eBPF and more. At the moment
the exam still references Calico. Should you want to try the labs a second time there is an appendix to install
Cilium instead.