#question 1 upgrade cluster and worker
kubectl get nodes
kubectl drain controlplane
kubectl drain controlplane   --ignore-daemonsets
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt-cache madison kubeadm
sudo apt-mark unhold kubeadm
sudo apt-get update && sudo apt-get install -y kubeadm='1.29.0-1.1'
sudo apt-mark hold kubeadm
sudo kubeadm upgrade apply v1.29.0

sudo apt-get update && sudo apt-get install -y kubelet='1.29.0-1.1'
sudo apt-get update && sudo apt-get install -y kubectl='1.29.0-1.1'
sudo apt-mark hold kubelet kubectl
sudo systemctl daemon-reload
sudo systemctl restart kubelet
kubectl version
kubectl get nodes
kubectl uncordon controlplane
kubectl get nodes
kubectl drain node01
kubectl drain node01 --ignore-daemonsets
ssh node01
kubectl uncordon node01
kubectl get nodes

kubectl get deployments -n admin2406 -o=custom-columns=DEPLOYMENT:.metadata.name,CONTAINER_IMAGE:.spec.template.spec.containers[*].image,READY_REPLICAS:.status.readyReplicas,NAMESPACE:.metadata.namespace --sort-by=.metadata.name
kubectl get deployments -n admin2406 -o=custom-columns=DEPLOYMENT:.metadata.name,CONTAINER_IMAGE:.spec.template.spec.containers[*].image,READY_REPLICAS:.status.readyReplicas,NAMESPACE:.metadata.namespace --sort-by=.metadata.name > /opt/admin2406_data

vi /root/CKA/admin.kubeconfig
kubectl create deployment  nginx-deploy --image=nginx:1.16
kubectl set image deployment/nginx-deploy nginx=nginx:1.17

kubectl get pods -n alpha
kubectl events alpha-mysql-5b944d484-ssdtz
kubectl describe pod alpha-mysql-5b944d484-ssdtz -n alpha
kubectl describe pod alpha-mysql-5b944d484-ssdtz -n alpha | grep -i mysql-alpha-pvc
kubectl describe pvc mysql-alpha-pvc -n alpha
kubectl get pvc --all-namespaces
kubectl get pv --all-namespaces
kubectt get pv alpha-pv -n alpha
kubectl  get pv alpha-pv -n alpha -o yaml
kubectl get storageclass -n alpha
vi my-pvc.yaml
kubectl apply -f my-pvc.yaml
kubectl get pvc -n alpha
kubectl get pv -n alpha
kubectl get pods -n alpha
kubectl get deployment  -n alpha
kubectl edit deployment alpha-mysql  -n alpha

#find the keys from etcd pod if it is a static pod otherwise find it from systemctl cat service

kubectl describe pod etcd-controlplane -n kube-system | grep -i etcd
#--cacert, --cert, --key
export ETCDCTL_API=3
export ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt
export ETCDCTL_CERT=/etc/kubernetes/pki/etcd/server.crt
export ETCDCTL_KEY=/etc/kubernetes/pki/etcd/server.key
mkdir -p /opt/
etcdctl --endpoints=https://127.0.0.1:2379 snapshot save /opt/etcd-backup.db
########

kubectl -n admin1401 run secret-1401 --image=busybox --dry-run=client -o yaml > my-cc.yaml
kubectl get secrets
kubectl get secrets -n admin1401
kubectl describe secret dotfile-secret -n admin1401
my-cc.yaml
kubectl apply -f my-cc.yaml



