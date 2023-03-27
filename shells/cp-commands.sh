sudo -i
apt-get update && apt-get upgrade -y
apt-get install -y vim
apt install curl apt-transport-https vim git wget gnupg2 software-properties-common lsb-release ca-certificates uidmap -y
swapoff -a
modprobe overlay
modprobe br_netfilter

cat << EOF | tee /etc/sysctl.d/kubernetes.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

sysctl --system
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
apt-mark hold kubelet kubeadm kubectl


wget https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml

hostname -i
# 172.31.39.48

ip addr show

vim /etc/hosts
# 172.31.39.48 k8scp

vim kubeadm-config.yaml


apiVersion: kubeadm.k8s.io/v1beta3
kind: ClusterConfiguration
kubernetesVersion: 1.25.1 #<-- Use the word stable for newest version
controlPlaneEndpoint: "k8scp:6443" #<-- Use the alias we put in /etc/hosts not the IP
networking:
  podSubnet: 192.168.0.0/16 #<-- Match the IP range from the Calico config file


kubeadm init --config=kubeadm-config.yaml --upload-certs | tee kubeadm-init.out #<-- Save kubeadm-init.out for future review

exit

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
less .kube/config


sudo cp /root/calico.yaml .
kubectl apply -f calico.yaml


sudo apt-get install bash-completion -y
# <exit and log back in>
# source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> $HOME/.bashrc

kubectl help create
sudo kubeadm config print init-defaults

sudo kubeadm token list

# ====== to add worker
openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/ˆ.* //'
