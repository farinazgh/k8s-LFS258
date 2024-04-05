kubectl cluster-info
kubectl get nodes
# gives the number of clusters
kubectl config view

# switch
kubectl config use-context cluster1

kubectl get nodes
# switch back
kubectl config use-context cluster2

ubectl get pods -n kube-system


kubectl describe pod kube-apiserver-cluster2-controlplane   -n kube-system | grep -i etcd

kubectl config use-context cluster1
kubectl describe pod kube-apiserver-cluster1-controlplane   -n kube-system | grep -i etcd
kubectl describe etcd-cluster1-controlplane -n kube-system | grep -i data
kubectl describe pod etcd-cluster1-controlplane -n kube-system | grep -i data

ssh etcd-server

ps -ef | grep etcd
kubectl get nodes
ETCDCTL_API=3 etcdctl  --endpoints=https://127.0.0.1:2379  --cacert=/etc/etcd/pki/ca.pem  --cert=/etc/etcd/pki/etcd.pem  --key=/etc/etcd/pki/etcd-key.pem   member list









ps -ef | grep etcd
export ETCDCTL_API=3
etcdctl version
export ETCDCTL_CACERT=/etc/etcd/pki/ca.pem
export ETCDCTL_KEY=/etc/etcd/pki/etcd-key.pem
export ETCDCTL_CACERT=/etc/etcd/pki/etcd.pem
# gives the number of members of etcd db
etcdctl --endpoints https://192.20.25.21:2379 member list

# snapshotting happens here
etcdctl --endpoints https://192.20.25.21:2379 snapshot save /opt/cluster2.db


ETCDCTL_API=3
etcdctl --endpoints=https://127.0.0.1:2379
--cacert=/etc/etcd/pki/ca.pem
--cert=/etc/etcd/pki/etcd.pem -
-key=/etc/etcd/pki/etcd-key.pem
snapshot restore /root/cluster2.db --data-dir /var/lib/etcd-data-new


vi /etc/systemd/system/etcd.service
#add the new data-dir
chown -R etcd:etcd /var/lib/etcd-data-new
ls -ld /var/lib/etcd-data-new/
systemctl daemon-reload
systemctl restart etcd
history

# copy the snapshot file from cluster 2 to
scp /opt/cluster2.db etcd-server:/root
ssh etcd-server
kubectl get pods
sudo systemctl restart kube-scheduler
