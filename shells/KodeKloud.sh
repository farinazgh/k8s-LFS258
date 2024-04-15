#1. container run times page

cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

sudo sysctl --system

#2. kubeadmin installation
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gpg
mkdir /etc/apt/keyrings/
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-cache madison kubeadmin
sudo apt-cache madison kubeadm
sudo apt-get install -y kubelet=1.29.0-1.1 kubeadm=1.29.0-1.1 kubectl=1.29.0-1.1
sudo apt-mark hold kubelet kubeadm kubectl
ssh node01

ifconfig

kubeadm init --apiserver-cert-extra-sans=controlplane --apiserver-advertise-address=192.21.160.9 --pod-network-cidr=10.244.0.0/16

mkdir -p $HOME/.kube
kubeadm token create
kubeadm token list
ssh node01
curl -LO https://raw.githubusercontent.com/flannel-io/flannel/v0.20.2/Documentation/kube-flannel.yml
cat kube-flannel.yml
cat kube-flannel.yml  | grep -i ip-
vi kube-flannel.yml
#
#     args:
#     - --ip-masq
#     - --kube-subnet-mgr
#     - --iface=eth0
kubectl apply -f kube-flannel.yml
kubectl get pods -n kube-system
kubectl get pods -n kube-system --watch


#kubeadm token create
