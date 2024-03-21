ubuntu@ip-172-31-40-74:~$ sudo mkdir /opt/sfw
ubuntu@ip-172-31-40-74:~$ sudo chmod 1777 /opt/sfw/
ubuntu@ip-172-31-40-74:~$ sudo bash -c 'echo software > /opt/sfw/hello.txt'
ubuntu@ip-172-31-40-74:~$ cat /opt/sfw/hello.txt
software
ubuntu@ip-172-31-40-74:~$ cat /etc/exports
# /etc/exports: the access control list for filesystems which may be exported
#               to NFS clients.  See exports(5).
#
# Example for NFSv2 and NFSv3:
# /srv/homes       hostname1(rw,sync,no_subtree_check) hostname2(ro,sync,no_subtree_check)
#
# Example for NFSv4:
# /srv/nfs4        gss/krb5i(rw,sync,fsid=0,crossmnt,no_subtree_check)
# /srv/nfs4/homes  gss/krb5i(rw,sync,no_subtree_check)
#
ubuntu@ip-172-31-40-74:~$ vi /etc/exports

[1]+  Stopped                 vi /etc/exports
ubuntu@ip-172-31-40-74:~$ sudo vi /etc/exports
ubuntu@ip-172-31-40-74:~$ sudo exportfs -ra
ubuntu@ip-172-31-40-74:~$ sudo apt-get -y install nfs-common
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
nfs-common is already the newest version (1:2.6.1-1ubuntu1.2).
nfs-common set to manually installed.
0 upgraded, 0 newly installed, 0 to remove and 2 not upgraded.
ubuntu@ip-172-31-40-74:~$ showmount
Hosts on ip-172-31-40-74:
ubuntu@ip-172-31-40-74:~$ showmount -e k8scp
Export list for k8scp:
/opt/sfw *
ubuntu@ip-172-31-40-74:~$ sudo mount k8scp:/opt/sfw /mnt
ubuntu@ip-172-31-40-74:~$ ls -l /mnt
total 4
-rw-r--r-- 1 root root 9 Mar 21 06:22 hello.txt
ubuntu@ip-172-31-40-74:~$ hostname
ip-172-31-40-74
ubuntu@ip-172-31-40-74:~$ vi my-persistent-volume.yaml
ubuntu@ip-172-31-40-74:~$ kubectl apply -f my-persistent-volume.yaml
persistentvolume/pvvol-1 created
ubuntu@ip-172-31-40-74:~$ kubectl get pv -o wide
NAME      CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM   STORAGECLASS   REASON   AGE   VOLUMEMODE
pvvol-1   1Gi        RWX            Retain           Available                                   18s   Filesystem
ubuntu@ip-172-31-40-74:~$ vi my-pvc-claim.yaml
ubuntu@ip-172-31-40-74:~$ kubectl apply -f my-pvc-claim.yaml
persistentvolumeclaim/pvc-one created
ubuntu@ip-172-31-40-74:~$ kubectl get pvc pvc-one -o wide
NAME      STATUS   VOLUME    CAPACITY   ACCESS MODES   STORAGECLASS   AGE   VOLUMEMODE
pvc-one   Bound    pvvol-1   1Gi        RWX                           20s   Filesystem
ubuntu@ip-172-31-40-74:~$ kubectl get pv -o wide
NAME      CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM             STORAGECLASS   REASON   AGE     VOLUMEMODE
pvvol-1   1Gi        RWX            Retain           Bound    default/pvc-one                           5m26s   Filesystem
ubuntu@ip-172-31-40-74:~$ vi nfs-pod.yaml
ubuntu@ip-172-31-40-74:~$ kubectl apply -f nfs-pod.yaml
deployment.apps/nginx-nfs created
ubuntu@ip-172-31-40-74:~$ kubectl get pvc pvc-one -o wide
NAME      STATUS   VOLUME    CAPACITY   ACCESS MODES   STORAGECLASS   AGE   VOLUMEMODE
pvc-one   Bound    pvvol-1   1Gi        RWX                           16m   Filesystem
ubuntu@ip-172-31-40-74:~$ kubectl get pv -o wide
NAME      CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM             STORAGECLASS   REASON   AGE   VOLUMEMODE
pvvol-1   1Gi        RWX            Retain           Bound    default/pvc-one                           21m   Filesystem
ubuntu@ip-172-31-40-74:~$ kubectl describe pod nginx-nfs
Name:             nginx-nfs-68686f6d59-wpv4d
Namespace:        default
Priority:         0
Service Account:  default
Node:             ip-172-31-40-74/172.31.40.74
Start Time:       Thu, 21 Mar 2024 07:00:39 +0000
Labels:           pod-template-hash=68686f6d59
                  run=nginx
Annotations:      cni.projectcalico.org/containerID: 3179cf366b1b3874b51181764af7ed611175ab61a26cab7a4d6b2c34e4fa6819
                  cni.projectcalico.org/podIP: 192.168.10.33/32
                  cni.projectcalico.org/podIPs: 192.168.10.33/32
Status:           Running
IP:               192.168.10.33
IPs:
  IP:           192.168.10.33
Controlled By:  ReplicaSet/nginx-nfs-68686f6d59
Containers:
  nginx:
    Container ID:   containerd://44a0200d3babbae3da3f6e7133e57d66b5750fc77cabce3b5940a25bc9c22158
    Image:          nginx
    Image ID:       docker.io/library/nginx@sha256:6db391d1c0cfb30588ba0bf72ea999404f2764febf0f1f196acd5867ac7efa7e
    Port:           80/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Thu, 21 Mar 2024 07:00:41 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /opt from nfs-vol (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-ld5bk (ro)
Conditions:
  Type              Status
  Initialized       True
  Ready             True
  ContainersReady   True
  PodScheduled      True
Volumes:
  nfs-vol:
    Type:       PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
    ClaimName:  pvc-one
    ReadOnly:   false
  kube-api-access-ld5bk:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  45s   default-scheduler  Successfully assigned default/nginx-nfs-68686f6d59-wpv4d to ip-172-31-40-74
  Normal  Pulling    44s   kubelet            Pulling image "nginx"
  Normal  Pulled     43s   kubelet            Successfully pulled image "nginx" in 758ms (758ms including waiting)
  Normal  Created    43s   kubelet            Created container nginx
  Normal  Started    43s   kubelet            Started container nginx

ubuntu@ip-172-31-40-74:~$
