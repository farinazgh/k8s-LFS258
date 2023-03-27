sudo -i
apt-get update && apt-get upgrade -y
sudo apt install curl apt-transport-https vim git wget gnupg2 software-properties-common lsb-release ca-certificates uidmap -y
sudo swapoff -a
sudo modprobe overlay
sudo modprobe br_netfilter
cat << EOF | tee /etc/sysctl.d/kubernetes.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF
sudo sysctl --system
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update && apt-get install containerd.io -y
containerd config default | tee /etc/containerd/config.toml
sed -e 's/SystemdCgroup = false/SystemdCgroup = true/g' -i /etc/containerd/config.toml
systemctl restart containerd
vim /etc/apt/sources.list.d/kubernetes.list
# deb http://apt.kubernetes.io/ kubernetes-xenial main
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
apt-get update
apt-get install -y kubeadm=1.25.1-00 kubelet=1.25.1-00 kubectl=1.25.1-00
apt-mark hold kubeadm kubelet kubectl
hostname -i
# 172.31.44.133
ip addr show ens4 | grep inet
 # inet 10.128.0.3/32 brd 10.128.0.3 scope global ens4
 # inet6 fe80::4001:aff:fe8e:2/64 scope link


vim /etc/hosts




172.31.39.48 k8scp #<-- Add this line


kubeadm join --token fxdchp.evoo6n2tlzftp3pu k8scp:6443 --discovery-token-ca-cert-hash sha256:xxxxxxxxx



#[preflight] Running pre-flight checks
#        [WARNING SystemVerification]: missing optional cgroups: blkio
#[preflight] Reading configuration from the cluster...
#[preflight] FYI: You can look at this config file with 'kubectl -n kube-system get cm kubeadm-config -o yaml'
#[kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
#[kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
#[kubelet-start] Starting the kubelet
#[kubelet-start] Waiting for the kubelet to perform the TLS Bootstrap...
#
#This node has joined the cluster:
#* Certificate signing request was sent to apiserver and a response was received.
#* The Kubelet was informed of the new secure connection details.
#
#Run 'kubectl get nodes' on the control-plane to see this node join the cluster.