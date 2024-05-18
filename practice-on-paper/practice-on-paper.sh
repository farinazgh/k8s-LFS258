kubectl top pods --sort-by=cpu   --selector app=auth -n web
kubectl describe nodes | grep -i taint
kubectl logs data-handler -c proc -n backend | grep -i error > /k8s/0002/errors.txt

##### to remember
# this is when etcd is installed as a service and NOT as a static pod in kubeadm env
#what is etcd name in this system?
systemctl list-units --type=service | grep etcd



systemctl cat etcd.service
systemctl cat etcd.service | grep -i listen
systemctl cat etcd.service | grep -i etcd

export ETCDCTL_CERT=/home/cloud_user/etcd-certs/etcd-server.crt
export ETCDCTL_API=3
export ETCDCTL_CACERT=/home/cloud_user/etcd-certs/etcd-ca.pem
export ETCDCTL_KEY=/home/cloud_user/etcd-certs/etcd-server.key
mkdir -p  /home/cloud_user/
etcdctl --endpoints="https://10.0.1.102:2379" snapshot save /home/cloud_user/etcd_backup.db

# you need to run it with sudo otherwise it does now allow you to mkdir /var/lib/etcd

sudo etcdctl --data-dir /var/lib/etcd  snapshot restore etcd_backup.db

#you need to stop systemctl stop etcd before removing /var/lib/etc
###################
#cluster upgrade
#################
# pre-checks
kubectl version
kubectl get nodes
kubectl get nodes | grep -i taint
kubectl get deployments
kubectl get pods -o wide
sudo apt-cache madison kubeadm

# upgrade starts here

kubectl drain controlplane  --ignore-daemonsets
# check after the drain all pods are moved to the worker node garcefully
kubectl get pods -o wide
# from kubeadm install page
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
# all from kubeadm upgrade page
sudo apt-mark unhold kubeadm
sudo apt-get update && sudo apt-get install
sudo apt update
sudo apt-cache madison kubeadm

sudo apt-get install -y kubeadm='1.29.0-1.1'
sudo apt-mark hold kubeadm
sudo kubeadm upgrade plan
kubeadm upgrade apply v1.29.0

#pods are still on worker
kubectl get pods -o wide

#make the node schedulable again
kubectl uncordon controlplane
kubectl get nodes
kubectl get pods -o wide
sudo apt-mark unhold kubelet kubectl
sudo apt-get update
sudo apt-get install -y kubelet='1.29.0-1.1'
sudo apt-get install -y kubectl='1.29.0-1.1'
sudo apt-mark hold kubelet kubectl
sudo systemctl daemon-reload
sudo systemctl restart kubelet
# do all above for worker node
kubectl drain node01
kubectl drain node01 --ignore-daemonsets
kubectl get pods -o wide
kubectl get nodes
ssh node01
kubectl uncordon node01
kubectl get nodes
history

# 1. drain controlplane
# 2. upgrade
# 3. uncordon






