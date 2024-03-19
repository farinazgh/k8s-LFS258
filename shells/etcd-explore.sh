kubectl -n kube-system exec -it etcd-ip-172-31-40-74 -- sh \
-c "ETCDCTL_API=3 \
ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt \
ETCDCTL_CERT=/etc/kubernetes/pki/etcd/server.crt \
ETCDCTL_KEY=/etc/kubernetes/pki/etcd/server.key \
etcdctl --endpoints=https://127.0.0.1:2379 member list -w table"
  #  +------------------+---------+-----------------+---------------------------+---------------------------+------------+
  #  |        ID        | STATUS  |      NAME       |        PEER ADDRS         |       CLIENT ADDRS        | IS LEARNER |
  #  +------------------+---------+-----------------+---------------------------+---------------------------+------------+
  #  | 85b662448f547898 | started | ip-172-31-40-74 | https://172.31.40.74:2380 | https://172.31.40.74:2379 |      false |
  #  +------------------+---------+-----------------+---------------------------+---------------------------+------------+
  #   
 kubectl -n kube-system exec -it etcd-ip-172-31-40-74 -- sh \
-c "ETCDCTL_API=3 \
ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt \
ETCDCTL_CERT=/etc/kubernetes/pki/etcd/server.crt \
ETCDCTL_KEY=/etc/kubernetes/pki/etcd/server.key \
etcdctl --endpoints=https://127.0.0.1:2379 snapshot save /var/lib/etcd/snapshot.db "
  #  {"level":"info","ts":"2024-03-19T12:18:46.609987Z","caller":"snapshot/v3_snapshot.go:65","msg":"created temporary db file","path":"/var/lib/etcd/snapshot.db.part"}
  #  {"level":"info","ts":"2024-03-19T12:18:46.62181Z","logger":"client","caller":"v3@v3.5.12/maintenance.go:212","msg":"opened snapshot stream; downloading"}
  #  {"level":"info","ts":"2024-03-19T12:18:46.622689Z","caller":"snapshot/v3_snapshot.go:73","msg":"fetching snapshot","endpoint":"https://127.0.0.1:2379"}
  #  {"level":"info","ts":"2024-03-19T12:18:46.68039Z","logger":"client","caller":"v3@v3.5.12/maintenance.go:220","msg":"completed snapshot read; closing"}
  #  {"level":"info","ts":"2024-03-19T12:18:46.699205Z","caller":"snapshot/v3_snapshot.go:88","msg":"fetched snapshot","endpoint":"https://127.0.0.1:2379","size":"3.7 MB","took":"now"}
  #  {"level":"info","ts":"2024-03-19T12:18:46.69988Z","caller":"snapshot/v3_snapshot.go:97","msg":"saved","path":"/var/lib/etcd/snapshot.db"}
  #  Snapshot saved at /var/lib/etcd/snapshot.db

ls -lrt  /var/lib/etcd/snapshot.db
  #  ls: cannot access '/var/lib/etcd/snapshot.db': Permission denied
sudo ls -lrt  /var/lib/etcd/snapshot.db
  #  -rw------- 1 root root 3678240 Mar 19 12:18 /var/lib/etcd/snapshot.db


##I deployed an nginx deployment and the following keys were added to etcd-ip-172-31-40-74/registry/pods/default/nginx-7854ff8877-cxd7b
  #  /registry/replicasets/default/nginx-7854ff8877

etcdctl get /registry/replicasets/default/nginx-7854ff8877


/registry/events/default/nginx-7854ff8877-cxd7b.17be293a38bac5d3
/registry/events/default/nginx-7854ff8877-cxd7b.17be293a5bf8b208
/registry/events/default/nginx-7854ff8877-cxd7b.17be293a8011fd9b
/registry/events/default/nginx-7854ff8877-cxd7b.17be293a81a4bb01
/registry/events/default/nginx-7854ff8877-cxd7b.17be293a8614f494
/registry/events/default/nginx-7854ff8877-jdbnw.17be26182088a1db
/registry/events/default/nginx-7854ff8877-jdbnw.17be26184179d8d1
/registry/events/default/nginx-7854ff8877-jdbnw.17be2618653b0f81
/registry/events/default/nginx-7854ff8877-jdbnw.17be2618666f1469
/registry/events/default/nginx-7854ff8877-jdbnw.17be26186a3a268d
/registry/events/default/nginx-7854ff8877-jdbnw.17be27c2ab07b43f
/registry/events/default/nginx-7854ff8877-k4nqb.17be25ffabd2a8e0
/registry/events/default/nginx-7854ff8877-k4nqb.17be25ffcf883485
/registry/events/default/nginx-7854ff8877-k4nqb.17be2601371451bb
/registry/events/default/nginx-7854ff8877-k4nqb.17be2601386ade2a
/registry/events/default/nginx-7854ff8877-k4nqb.17be26013c9c430c
/registry/events/default/nginx-7854ff8877-k4nqb.17be26070c18f9b9
/registry/events/default/nginx-7854ff8877.17be26181f479302
/registry/events/default/nginx-7854ff8877.17be293a37ded23c
/registry/events/default/nginx.17be26181ebe1d87
/registry/events/default/nginx.17be293a368eb6e2



