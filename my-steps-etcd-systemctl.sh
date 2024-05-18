systemctl list-unit-files --type=service

# find the listen url
systemctl cat etcd.service
systemctl cat etcd.service | grep -i listen

#locate where the instructions tell you the keys
ls -l /home/cloud_user/etcd-certs
export ETCDCTL_API=3
export ETCDCTL_CACERT=/home/cloud_user/etcd-certs/etcd-ca.pem
export ETCDCTL_CERT=/home/cloud_user/etcd-certs/etcd-server.crt
export ETCDCTL_KEY=/home/cloud_user/etcd-certs/etcd-server.key

#make sure the dir exist
mkdir -p /home/cloud_user/
#take the backup
etcdctl --endpoints=https://10.0.1.101:2379 snapshot save /home/cloud_user/etcd_backup.db
ls -lrt /home/cloud_user/etcd_backup.db

# restore

sudo rm -rf /var/lib/etcd/
sudo etcdctl --data-dir /var/lib/etcd snapshot restore /home/cloud_user/etcd_backup.db
#this is very important
chown -R etcd:etcd /var/lib/etcd
systemctl restart etcd.service
sudo systemctl status etcd.service

ifconfig
kubectl get nodes -o wide #gives internal cluster ip for eth0
ip route show default
netstat -tunlp


kubectl -n kube-system logs kube-proxy-dmmh5 | grep -i proxy

#    all of them we look at eth0 for answers
kubectl get pv --sort-by '.spec.capacity.storage'
kubectl get pv --sort-by '.spec.capacity.storage' | awk '{print $1}'
kubectl get pv --sort-by '.spec.capacity.storage' | awk '{print $1}' >  /home/cloud_user/pv_list.txt
vi  /home/cloud_user/pv_list.txt
kubectl -n beebox-mobile exec quark -- cat /etc/key/key.txt
echo 1267aa45 > /home/cloud_user/key.txt
