echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

sudo apt update
sudo apt-cache madison kubeadm

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

sudo apt-mark unhold kubelet kubectl
sudo apt-get update && sudo apt-get install -y kubelet='1.29.3-1.1' kubectl='1.29.3-1.1'
sudo apt-mark hold kubelet kubectl

sudo systemctl daemon-reload
sudo systemctl restart kubelet
export KUBECONFIG=/home/ubuntu/.kube/config

kubectl uncordon ip-172-31-40-74
