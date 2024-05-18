#this part kubernetes.list and key ring should be taken from installation not upgrade
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list

#search for Upgrading kubeadm clusters
sudo apt update
sudo apt-cache madison kubeadm

# IMPORTANT this part should be done only for the api-server master the only node that has kubeadm

sudo apt-mark unhold kubeadm && sudo apt-get update && sudo apt-get install -y kubeadm='1.29.3-1.1' && sudo apt-mark hold kubeadm
kubeadm version

sudo kubeadm upgrade plan
sudo kubeadm upgrade apply v1.29.3

kubectl get nodes -o wide
kubectl drain ip-172-31-40-74  --ignore-daemonsets
kubectl drain ip-172-31-40-74  --ignore-daemonsets --force
kubectl drain ip-172-31-40-74  --ignore-daemonsets --force  --delete-emptydir-data

# kublet should be upgraded manually

sudo apt-mark unhold kubelet kubectl && sudo apt-get update && sudo apt-get install -y kubelet='1.29.3-1.1' kubectl='1.29.3-1.1' && sudo apt-mark hold kubelet kubectl

sudo -i

# IMPORTANT this part should be done for all nodes in the cluster as all nodes have kubelet and kubectl
sudo apt-mark unhold kubelet kubectl
sudo apt-get update && sudo apt-get install -y kubelet='1.29.3-1.1' kubectl='1.29.3-1.1'
sudo apt-mark hold kubelentt kubectl

sudo systemctl daemon-reload
sudo systemctl restart kubelet
# note do not use sudo here it will not work
kubectl uncordon ip-172-31-40-74
