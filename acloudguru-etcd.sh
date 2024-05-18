etcd --listen-client-urls=http://$PRIVATE_IP:2379  --advertise-client-urls=http://$PRIVATE_IP:2379
etcd --listen-client-urls=http://$IP1:2379,http://$IP2:2379,http://$IP3:2379,http://$IP4:2379,http://$IP5:2379 --advertise-client-urls=http://$IP1:2379,http://$IP2:2379,http://$IP3:2379,http://$IP4:2379,http://$IP5:2379

ETCDCTL_API=3
etcdctl --endpoints 10.2.0.9:2379 \
--cert=/etc/kubernetes/pki/etcd/server.crt \
--key=/etc/kubernetes/pki/etcd/server.key \
--cacert=/etc/kubernetes/pki/etcd/ca.crt  \
member list

etcdctl --endpoints=http://10.0.0.2,http://10.0.0.3 member list

export ETCD_NAME="member4"
export ETCD_INITIAL_CLUSTER="member2=http://10.0.0.2:2380,member3=http://10.0.0.3:2380,member4=http://10.0.0.4:2380"
export ETCD_INITIAL_CLUSTER_STATE=existing


ETCDCTL_API=3 etcdctl --endpoints $ENDPOINT snapshot save snapshot.db
ETCDCTL_API=3 etcdctl --write-out=table snapshot status snapshot.db


ETCDCTL_API=3 etcdctl -h


ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379 --cacert=<trusted-ca-file> --cert=<cert-file> --key=<key-file> snapshot save <backup-file-location>

ETCDCTL_API=3 etcdctl --data-dir <data-dir-location> snapshot restore snapshot.db


export ETCDCTL_API=3
etcdctl --data-dir <data-dir-location> snapshot restore snapshot.db


ETCDCTL_API=3 etcdctl get cluster.name --endpoints=https://10.0.1.101:2379 --cacert=/home/cloud_user/etcd-certs/etcd-ca.pem --cert=/home/cloud_user/etcd-certs/etcd-server.crt --key=/home/cloud_user/etcd-certs/etcd-server.key
ETCDCTL_API=3 etcdctl snapshot save /home/cloud_user/etcd_backup.db --endpoints=https://10.0.1.101:2379 --cacert=/home/cloud_user/etcd-certs/etcd-ca.pem --cert=/home/cloud_user/etcd-certs/etcd-server.crt  --key=/home/cloud_user/etcd-certs/etcd-server.key


sudo systemctl stop etcd
sudo rm -rf /var/lib/etcd

sudo ETCDCTL_API=3 etcdctl snapshot restore /home/cloud_user/etcd_backup.db \
--initial-cluster etcd-restore=https://10.0.1.101:2380 \
--initial-advertise-peer-urls https://10.0.1.101:2380 \
--name etcd-restore \
--data-dir /var/lib/etcd

sudo chown -R etcd:etcd /var/lib/etcd

sudo systemctl start etcd

ETCDCTL_API=3 etcdctl get cluster.name \
--endpoints=https://10.0.1.101:2379 \
--cacert=/home/cloud_user/etcd-certs/etcd-ca.pem \
--cert=/home/cloud_user/etcd-certs/etcd-server.crt \
--key=/home/cloud_user/etcd-certs/etcd-server.key

#do not forget scaling controller manager