    1  kubectl get deployments | wc
    2  kubectl get pods -o wide  -n kube-system
    3  kubectl describe pod etcd-controlplane
    4  kubectl describe pod etcd-controlplane  -n kube-syste,
    5  kubectl describe pod etcd-controlplane  -n kube-system
    6  kubectl describe pod etcd-controlplane  -n kube-system | grep -i image
    7  kubectl get services -n kube-syste,
    8  kubectl get services -n kube-system
    9  kubectl describe pod etcd-controlplane  -n kube-system | grep -icrt
   10  kubectl describe pod etcd-controlplane  -n kube-system | grep -i crt
   12  export ETCDCTL_API=3
   13  export ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt
   14  export ETCDCTL_CERT=/etc/kubernetes/pki/etcd/server.crt
   15  export ETCDCTL_KEY=/etc/kubernetes/pki/etcd/server.key
   16  etcdctl version
   17  etcdl --help
   18  etcdl -h
   19  etcdctl -h
   20  etcdctl --endpoints=https://127.0.0.1:2379 snapshot save /opt/snapshot-pre-boot.db
   21  kubectl get all --all-namespaces
   22  etcdctl --data-dir  /var/lib/etcd-from-backup snapshot restore /opt/snapshot-pre-boot.db
   23  kubectl get all --all-namespaces
   24  cd /etc/kubernetes/manifests/
   25  ls
   26  vi etcd.yaml
   27  history
