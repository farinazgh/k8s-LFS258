ubuntu@ip-172-31-40-74:~$ kubectl get node
#  NAME              STATUS   ROLES           AGE   VERSION
#  ip-172-31-40-74   Ready    control-plane   19h   v1.28.8
ubuntu@ip-172-31-40-74:~$ kubectl get node -o wide
#  NAME              STATUS   ROLES           AGE   VERSION   INTERNAL-IP    EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION   CONTAINER-RUNTIME
#  ip-172-31-40-74   Ready    control-plane   19h   v1.28.8   172.31.40.74   <none>        Ubuntu 22.04.4 LTS   6.5.0-1014-aws   containerd://1.6.28
ubuntu@ip-172-31-40-74:~$ kubectl describe node ip-172-31-40-74
Name:               ip-172-31-40-74
Roles:              control-plane
Labels:             beta.kubernetes.io/arch=amd64
                    beta.kubernetes.io/os=linux
                    kubernetes.io/arch=amd64
                    kubernetes.io/hostname=ip-172-31-40-74
                    kubernetes.io/os=linux
                    node-role.kubernetes.io/control-plane=
                    node.kubernetes.io/exclude-from-external-load-balancers=
Annotations:        kubeadm.alpha.kubernetes.io/cri-socket: unix:///var/run/containerd/containerd.sock
                    node.alpha.kubernetes.io/ttl: 0
                    projectcalico.org/IPv4Address: 172.31.40.74/20
                    projectcalico.org/IPv4IPIPTunnelAddr: 192.168.10.0
                    volumes.kubernetes.io/controller-managed-attach-detach: true
CreationTimestamp:  Mon, 18 Mar 2024 15:13:53 +0000
Taints:             node-role.kubernetes.io/control-plane:NoSchedule
Unschedulable:      false
Lease:
  HolderIdentity:  ip-172-31-40-74
  AcquireTime:     <unset>
  RenewTime:       Tue, 19 Mar 2024 11:02:21 +0000
Conditions:
  Type                 Status  LastHeartbeatTime                 LastTransitionTime                Reason                       Message
  ----                 ------  -----------------                 ------------------                ------                       -------
  NetworkUnavailable   False   Tue, 19 Mar 2024 10:57:24 +0000   Tue, 19 Mar 2024 10:57:24 +0000   CalicoIsUp                   Calico is running on this node
  MemoryPressure       False   Tue, 19 Mar 2024 11:02:23 +0000   Mon, 18 Mar 2024 15:13:52 +0000   KubeletHasSufficientMemory   kubelet has sufficient memory available
  DiskPressure         False   Tue, 19 Mar 2024 11:02:23 +0000   Mon, 18 Mar 2024 15:13:52 +0000   KubeletHasNoDiskPressure     kubelet has no disk pressure
  PIDPressure          False   Tue, 19 Mar 2024 11:02:23 +0000   Mon, 18 Mar 2024 15:13:52 +0000   KubeletHasSufficientPID      kubelet has sufficient PID available
  Ready                True    Tue, 19 Mar 2024 11:02:23 +0000   Mon, 18 Mar 2024 15:28:19 +0000   KubeletReady                 kubelet is posting ready status. AppArmor enabled
Addresses:
  InternalIP:  172.31.40.74
  Hostname:    ip-172-31-40-74
Capacity:
  cpu:                2
  ephemeral-storage:  7941576Ki
  hugepages-2Mi:      0
  memory:             3997716Ki
  pods:               110
Allocatable:
  cpu:                2
  ephemeral-storage:  7318956430
  hugepages-2Mi:      0
  memory:             3895316Ki
  pods:               110
System Info:
  Machine ID:                 48df6604b13945d28141b23fba039574
  System UUID:                ec249e6d-25cf-8185-e4ef-123b66954576
  Boot ID:                    dcf82c56-ff09-4cb1-97f6-bd5ec76e4e9d
  Kernel Version:             6.5.0-1014-aws
  OS Image:                   Ubuntu 22.04.4 LTS
  Operating System:           linux
  Architecture:               amd64
  Container Runtime Version:  containerd://1.6.28
  Kubelet Version:            v1.28.8
  Kube-Proxy Version:         v1.28.8
Non-terminated Pods:          (9 in total)
  Namespace                   Name                                        CPU Requests  CPU Limits  Memory Requests  Memory Limits  Age
  ---------                   ----                                        ------------  ----------  ---------------  -------------  ---
  kube-system                 calico-kube-controllers-68cdf756d9-sdj2v    0 (0%)        0 (0%)      0 (0%)           0 (0%)         19h
  kube-system                 calico-node-m25dv                           250m (12%)    0 (0%)      0 (0%)           0 (0%)         19h
  kube-system                 coredns-5dd5756b68-ftqjl                    100m (5%)     0 (0%)      70Mi (1%)        170Mi (4%)     19h
  kube-system                 coredns-5dd5756b68-mqdtt                    100m (5%)     0 (0%)      70Mi (1%)        170Mi (4%)     19h
  kube-system                 etcd-ip-172-31-40-74                        100m (5%)     0 (0%)      100Mi (2%)       0 (0%)         19h
  kube-system                 kube-apiserver-ip-172-31-40-74              250m (12%)    0 (0%)      0 (0%)           0 (0%)         19h
  kube-system                 kube-controller-manager-ip-172-31-40-74     200m (10%)    0 (0%)      0 (0%)           0 (0%)         19h
  kube-system                 kube-proxy-cjl4p                            0 (0%)        0 (0%)      0 (0%)           0 (0%)         19h
  kube-system                 kube-scheduler-ip-172-31-40-74              100m (5%)     0 (0%)      0 (0%)           0 (0%)         19h
Allocated resources:
  (Total limits may be over 100 percent, i.e., overcommitted.)
  Resource           Requests     Limits
  --------           --------     ------
  cpu                1100m (55%)  0 (0%)
  memory             240Mi (6%)   340Mi (8%)
  ephemeral-storage  0 (0%)       0 (0%)
  hugepages-2Mi      0 (0%)       0 (0%)
Events:
  Type     Reason                   Age                    From             Message
  ----     ------                   ----                   ----             -------
  Normal   Starting                 5m11s                  kube-proxy
  Normal   Starting                 19h                    kube-proxy
  Normal   Starting                 19h                    kube-proxy
  Normal   Starting                 19h                    kubelet          Starting kubelet.
  Warning  InvalidDiskCapacity      19h                    kubelet          invalid capacity 0 on image filesystem
  Normal   NodeHasSufficientMemory  19h                    kubelet          Node ip-172-31-40-74 status is now: NodeHasSufficientMemory
  Normal   NodeHasNoDiskPressure    19h                    kubelet          Node ip-172-31-40-74 status is now: NodeHasNoDiskPressure
  Normal   NodeHasSufficientPID     19h                    kubelet          Node ip-172-31-40-74 status is now: NodeHasSufficientPID
  Normal   NodeAllocatableEnforced  19h                    kubelet          Updated Node Allocatable limit across pods
  Normal   RegisteredNode           19h                    node-controller  Node ip-172-31-40-74 event: Registered Node ip-172-31-40-74 in Controller
  Normal   NodeReady                19h                    kubelet          Node ip-172-31-40-74 status is now: NodeReady
  Normal   NodeNotReady             19h                    kubelet          Node ip-172-31-40-74 status is now: NodeNotReady
  Warning  InvalidDiskCapacity      19h                    kubelet          invalid capacity 0 on image filesystem
  Normal   NodeHasSufficientMemory  19h                    kubelet          Node ip-172-31-40-74 status is now: NodeHasSufficientMemory
  Normal   NodeHasNoDiskPressure    19h                    kubelet          Node ip-172-31-40-74 status is now: NodeHasNoDiskPressure
  Normal   NodeHasSufficientPID     19h                    kubelet          Node ip-172-31-40-74 status is now: NodeHasSufficientPID
  Normal   Starting                 19h                    kubelet          Starting kubelet.
  Normal   NodeReady                19h                    kubelet          Node ip-172-31-40-74 status is now: NodeReady
  Normal   NodeAllocatableEnforced  19h                    kubelet          Updated Node Allocatable limit across pods
  Normal   NodeHasNoDiskPressure    19h (x7 over 19h)      kubelet          Node ip-172-31-40-74 status is now: NodeHasNoDiskPressure
  Warning  InvalidDiskCapacity      19h                    kubelet          invalid capacity 0 on image filesystem
  Normal   NodeHasSufficientMemory  19h (x8 over 19h)      kubelet          Node ip-172-31-40-74 status is now: NodeHasSufficientMemory
  Normal   Starting                 19h                    kubelet          Starting kubelet.
  Normal   NodeHasSufficientPID     19h (x7 over 19h)      kubelet          Node ip-172-31-40-74 status is now: NodeHasSufficientPID
  Normal   NodeAllocatableEnforced  19h                    kubelet          Updated Node Allocatable limit across pods
  Normal   RegisteredNode           19h                    node-controller  Node ip-172-31-40-74 event: Registered Node ip-172-31-40-74 in Controller
  Normal   Starting                 5m20s                  kubelet          Starting kubelet.
  Warning  InvalidDiskCapacity      5m20s                  kubelet          invalid capacity 0 on image filesystem
  Normal   NodeHasSufficientMemory  5m20s (x8 over 5m20s)  kubelet          Node ip-172-31-40-74 status is now: NodeHasSufficientMemory
  Normal   NodeHasNoDiskPressure    5m20s (x7 over 5m20s)  kubelet          Node ip-172-31-40-74 status is now: NodeHasNoDiskPressure
  Normal   NodeHasSufficientPID     5m20s (x7 over 5m20s)  kubelet          Node ip-172-31-40-74 status is now: NodeHasSufficientPID
  Normal   NodeAllocatableEnforced  5m20s                  kubelet          Updated Node Allocatable limit across pods
  Normal   RegisteredNode           4m53s                  node-controller  Node ip-172-31-40-74 event: Registered Node ip-172-31-40-74 in Controller
ubuntu@ip-172-31-40-74:~$ kubectl describe node | grep -i taint
Taints:             node-role.kubernetes.io/control-plane:NoSchedule
ubuntu@ip-172-31-40-74:~$ kubectl get pods --all-namespaces
NAMESPACE     NAME                                       READY   STATUS    RESTARTS        AGE
kube-system   calico-kube-controllers-68cdf756d9-sdj2v   1/1     Running   2 (8m44s ago)   19h
kube-system   calico-node-m25dv                          1/1     Running   2 (8m44s ago)   19h
kube-system   coredns-5dd5756b68-ftqjl                   1/1     Running   2 (8m44s ago)   19h
kube-system   coredns-5dd5756b68-mqdtt                   1/1     Running   2 (8m44s ago)   19h
kube-system   etcd-ip-172-31-40-74                       1/1     Running   2 (8m44s ago)   19h
kube-system   kube-apiserver-ip-172-31-40-74             1/1     Running   2 (8m44s ago)   19h
kube-system   kube-controller-manager-ip-172-31-40-74    1/1     Running   2 (8m44s ago)   19h
kube-system   kube-proxy-cjl4p                           1/1     Running   2 (8m44s ago)   19h
kube-system   kube-scheduler-ip-172-31-40-74             1/1     Running   2 (8m44s ago)   19h
ubuntu@ip-172-31-40-74:~$
ubuntu@ip-172-31-40-74:~$ kubectl get pods --all-namespaces
NAMESPACE     NAME                                       READY   STATUS    RESTARTS      AGE
kube-system   calico-kube-controllers-68cdf756d9-sdj2v   1/1     Running   2 (10m ago)   19h
kube-system   calico-node-m25dv                          1/1     Running   2 (10m ago)   19h
kube-system   coredns-5dd5756b68-ftqjl                   1/1     Running   2 (10m ago)   19h
kube-system   coredns-5dd5756b68-mqdtt                   1/1     Running   2 (10m ago)   19h
kube-system   etcd-ip-172-31-40-74                       1/1     Running   2 (10m ago)   19h
kube-system   kube-apiserver-ip-172-31-40-74             1/1     Running   2 (10m ago)   19h
kube-system   kube-controller-manager-ip-172-31-40-74    1/1     Running   2 (10m ago)   19h
kube-system   kube-proxy-cjl4p                           1/1     Running   2 (10m ago)   19h
kube-system   kube-scheduler-ip-172-31-40-74             1/1     Running   2 (10m ago)   19h
ubuntu@ip-172-31-40-74:~$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP group default qlen 1000
    link/ether 0a:1d:aa:f2:ea:cf brd ff:ff:ff:ff:ff:ff
    inet 172.31.40.74/20 metric 100 brd 172.31.47.255 scope global dynamic eth0
       valid_lft 2969sec preferred_lft 2969sec
    inet6 fe80::81d:aaff:fef2:eacf/64 scope link
       valid_lft forever preferred_lft forever
3: tunl0@NONE: <NOARP,UP,LOWER_UP> mtu 8981 qdisc noqueue state UNKNOWN group default qlen 1000
    link/ipip 0.0.0.0 brd 0.0.0.0
    inet 192.168.10.0/32 scope global tunl0
       valid_lft forever preferred_lft forever
6: cali197bdcf33f8@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8981 qdisc noqueue state UP group default qlen 1000
    link/ether ee:ee:ee:ee:ee:ee brd ff:ff:ff:ff:ff:ff link-netns cni-28a9fadf-6382-9a6f-1c0d-685f2742fe44
    inet6 fe80::ecee:eeff:feee:eeee/64 scope link
       valid_lft forever preferred_lft forever
7: calif97f7c7391a@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8981 qdisc noqueue state UP group default qlen 1000
    link/ether ee:ee:ee:ee:ee:ee brd ff:ff:ff:ff:ff:ff link-netns cni-92c7d0e5-7c7f-ed5a-28f9-22f926ce3584
    inet6 fe80::ecee:eeff:feee:eeee/64 scope link
       valid_lft forever preferred_lft forever
8: cali438ad4c245a@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8981 qdisc noqueue state UP group default qlen 1000
    link/ether ee:ee:ee:ee:ee:ee brd ff:ff:ff:ff:ff:ff link-netns cni-eedbb432-1097-d645-b9ac-47da9c1d0cfa
    inet6 fe80::ecee:eeff:feee:eeee/64 scope link
       valid_lft forever preferred_lft forever
ubuntu@ip-172-31-40-74:~$ kubectl create deployment nginx --image=nginx
deployment.apps/nginx created
ubuntu@ip-172-31-40-74:~$ kubectl get all
NAME                         READY   STATUS    RESTARTS   AGE
pod/nginx-7854ff8877-k4nqb   0/1     Pending   0          7s

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   19h

NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/nginx   0/1     1            0           7s

NAME                               DESIRED   CURRENT   READY   AGE
replicaset.apps/nginx-7854ff8877   1         1         0       7s
ubuntu@ip-172-31-40-74:~$ kubectl taint nodes  ip-172-31-40-74 node-role.kubernetes.io/control-plane:NoSchedule-
node/ip-172-31-40-74 untainted
ubuntu@ip-172-31-40-74:~$ kubectl delete deployment nginx
ubuntu@ip-172-31-40-74:~$ kubectl create deployment nginx --image=nginx --watch
error: unknown flag: --watch
See 'kubectl create deployment --help' for usage.
ubuntu@ip-172-31-40-74:~$ kubectl create deployment nginx --image=nginx --watch
error: unknown flag: --watch
See 'kubectl create deployment --help' for usage.
ubuntu@ip-172-31-40-74:~$ kubectl create deployment nginx --image=nginx
deployment.apps/nginx created
ubuntu@ip-172-31-40-74:~$ kubectl get all
NAME                         READY   STATUS    RESTARTS   AGE
pod/nginx-7854ff8877-jdbnw   1/1     Running   0          5s

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   19h

NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/nginx   1/1     1            1           5s

NAME                               DESIRED   CURRENT   READY   AGE
replicaset.apps/nginx-7854ff8877   1         1         1       5s
ubuntu@ip-172-31-40-74:~$ kubectl get all -o wide
NAME                         READY   STATUS    RESTARTS   AGE   IP              NODE              NOMINATED NODE   READINESS GATES
pod/nginx-7854ff8877-jdbnw   1/1     Running   0          18s   192.168.10.11   ip-172-31-40-74   <none>           <none>

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE   SELECTOR
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   19h   <none>

NAME                    READY   UP-TO-DATE   AVAILABLE   AGE   CONTAINERS   IMAGES   SELECTOR
deployment.apps/nginx   1/1     1            1           18s   nginx        nginx    app=nginx

NAME                               DESIRED   CURRENT   READY   AGE   CONTAINERS   IMAGES   SELECTOR
replicaset.apps/nginx-7854ff8877   1         1         1       18s   nginx        nginx    app=nginx,pod-template-hash=7854ff8877
ubuntu@ip-172-31-40-74:~$ kubectl describe deployment nginx
Name:                   nginx
Namespace:              default
CreationTimestamp:      Tue, 19 Mar 2024 11:13:13 +0000
Labels:                 app=nginx
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=nginx
Replicas:               1 desired | 1 updated | 1 total | 1 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=nginx
  Containers:
   nginx:
    Image:        nginx
    Port:         <none>
    Host Port:    <none>
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   nginx-7854ff8877 (1/1 replicas created)
Events:
  Type    Reason             Age   From                   Message
  ----    ------             ----  ----                   -------
  Normal  ScalingReplicaSet  51s   deployment-controller  Scaled up replica set nginx-7854ff8877 to 1
ubuntu@ip-172-31-40-74:~$ kubectl get pds
error: the server doesn't have a resource type "pds"
ubuntu@ip-172-31-40-74:~$ kubectl get pods
NAME                     READY   STATUS    RESTARTS   AGE
nginx-7854ff8877-jdbnw   1/1     Running   0          92s
ubuntu@ip-172-31-40-74:~$ kubectl get pods
NAME                     READY   STATUS    RESTARTS   AGE
nginx-7854ff8877-jdbnw   1/1     Running   0          2m7s
ubuntu@ip-172-31-40-74:~$ kubect describe pod nginx-7854ff8877-jdbnw
kubect: command not found
ubuntu@ip-172-31-40-74:~$ kubectl describe pod nginx-7854ff8877-jdbnw
Name:             nginx-7854ff8877-jdbnw
Namespace:        default
Priority:         0
Service Account:  default
Node:             ip-172-31-40-74/172.31.40.74
Start Time:       Tue, 19 Mar 2024 11:13:13 +0000
Labels:           app=nginx
                  pod-template-hash=7854ff8877
Annotations:      cni.projectcalico.org/containerID: 2adbd58def3c88e3950d74c98ef01240a95507301171ee7accd1e749a7206350
                  cni.projectcalico.org/podIP: 192.168.10.11/32
                  cni.projectcalico.org/podIPs: 192.168.10.11/32
Status:           Running
IP:               192.168.10.11
IPs:
  IP:           192.168.10.11
Controlled By:  ReplicaSet/nginx-7854ff8877
Containers:
  nginx:
    Container ID:   containerd://7a727e47f073281593c7c176548b8556ac57c318364892d772df697d1b62c65e
    Image:          nginx
    Image ID:       docker.io/library/nginx@sha256:6db391d1c0cfb30588ba0bf72ea999404f2764febf0f1f196acd5867ac7efa7e
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Tue, 19 Mar 2024 11:13:14 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-tbd24 (ro)
Conditions:
  Type              Status
  Initialized       True
  Ready             True
  ContainersReady   True
  PodScheduled      True
Volumes:
  kube-api-access-tbd24:
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
  Type    Reason     Age    From               Message
  ----    ------     ----   ----               -------
  Normal  Scheduled  2m30s  default-scheduler  Successfully assigned default/nginx-7854ff8877-jdbnw to ip-172-31-40-74
  Normal  Pulling    2m29s  kubelet            Pulling image "nginx"
  Normal  Pulled     2m29s  kubelet            Successfully pulled image "nginx" in 599ms (599ms including waiting)
  Normal  Created    2m29s  kubelet            Created container nginx
  Normal  Started    2m29s  kubelet            Started container nginx
ubuntu@ip-172-31-40-74:~$ pwd
/home/ubuntu
ubuntu@ip-172-31-40-74:~$
ubuntu@ip-172-31-40-74:~$ kubectl get events
LAST SEEN   TYPE      REASON                    OBJECT                        MESSAGE
20h         Normal    Starting                  node/ip-172-31-40-74          Starting kubelet.
20h         Warning   InvalidDiskCapacity       node/ip-172-31-40-74          invalid capacity 0 on image filesystem
20h         Normal    NodeHasSufficientMemory   node/ip-172-31-40-74          Node ip-172-31-40-74 status is now: NodeHasSufficientMemory
20h         Normal    NodeHasNoDiskPressure     node/ip-172-31-40-74          Node ip-172-31-40-74 status is now: NodeHasNoDiskPressure
20h         Normal    NodeHasSufficientPID      node/ip-172-31-40-74          Node ip-172-31-40-74 status is now: NodeHasSufficientPID
20h         Normal    NodeAllocatableEnforced   node/ip-172-31-40-74          Updated Node Allocatable limit across pods
20h         Normal    RegisteredNode            node/ip-172-31-40-74          Node ip-172-31-40-74 event: Registered Node ip-172-31-40-74 in Controller
20h         Normal    Starting                  node/ip-172-31-40-74
19h         Normal    NodeReady                 node/ip-172-31-40-74          Node ip-172-31-40-74 status is now: NodeReady
19h         Normal    Starting                  node/ip-172-31-40-74          Starting kubelet.
19h         Warning   InvalidDiskCapacity       node/ip-172-31-40-74          invalid capacity 0 on image filesystem
19h         Normal    NodeHasSufficientMemory   node/ip-172-31-40-74          Node ip-172-31-40-74 status is now: NodeHasSufficientMemory
19h         Normal    NodeHasNoDiskPressure     node/ip-172-31-40-74          Node ip-172-31-40-74 status is now: NodeHasNoDiskPressure
19h         Normal    NodeHasSufficientPID      node/ip-172-31-40-74          Node ip-172-31-40-74 status is now: NodeHasSufficientPID
19h         Normal    NodeNotReady              node/ip-172-31-40-74          Node ip-172-31-40-74 status is now: NodeNotReady
19h         Normal    NodeReady                 node/ip-172-31-40-74          Node ip-172-31-40-74 status is now: NodeReady
19h         Normal    NodeAllocatableEnforced   node/ip-172-31-40-74          Updated Node Allocatable limit across pods
19h         Normal    Starting                  node/ip-172-31-40-74          Starting kubelet.
19h         Warning   InvalidDiskCapacity       node/ip-172-31-40-74          invalid capacity 0 on image filesystem
19h         Normal    NodeHasSufficientMemory   node/ip-172-31-40-74          Node ip-172-31-40-74 status is now: NodeHasSufficientMemory
19h         Normal    NodeHasNoDiskPressure     node/ip-172-31-40-74          Node ip-172-31-40-74 status is now: NodeHasNoDiskPressure
19h         Normal    NodeHasSufficientPID      node/ip-172-31-40-74          Node ip-172-31-40-74 status is now: NodeHasSufficientPID
19h         Normal    NodeAllocatableEnforced   node/ip-172-31-40-74          Updated Node Allocatable limit across pods
19h         Normal    Starting                  node/ip-172-31-40-74
19h         Normal    RegisteredNode            node/ip-172-31-40-74          Node ip-172-31-40-74 event: Registered Node ip-172-31-40-74 in Controller
19m         Normal    Starting                  node/ip-172-31-40-74          Starting kubelet.
19m         Warning   InvalidDiskCapacity       node/ip-172-31-40-74          invalid capacity 0 on image filesystem
19m         Normal    NodeHasSufficientMemory   node/ip-172-31-40-74          Node ip-172-31-40-74 status is now: NodeHasSufficientMemory
19m         Normal    NodeHasNoDiskPressure     node/ip-172-31-40-74          Node ip-172-31-40-74 status is now: NodeHasNoDiskPressure
19m         Normal    NodeHasSufficientPID      node/ip-172-31-40-74          Node ip-172-31-40-74 status is now: NodeHasSufficientPID
19m         Normal    NodeAllocatableEnforced   node/ip-172-31-40-74          Updated Node Allocatable limit across pods
19m         Normal    Starting                  node/ip-172-31-40-74
19m         Normal    RegisteredNode            node/ip-172-31-40-74          Node ip-172-31-40-74 event: Registered Node ip-172-31-40-74 in Controller
3m50s       Normal    Scheduled                 pod/nginx-7854ff8877-jdbnw    Successfully assigned default/nginx-7854ff8877-jdbnw to ip-172-31-40-74
3m49s       Normal    Pulling                   pod/nginx-7854ff8877-jdbnw    Pulling image "nginx"
3m49s       Normal    Pulled                    pod/nginx-7854ff8877-jdbnw    Successfully pulled image "nginx" in 599ms (599ms including waiting)
3m49s       Normal    Created                   pod/nginx-7854ff8877-jdbnw    Created container nginx
3m49s       Normal    Started                   pod/nginx-7854ff8877-jdbnw    Started container nginx
8m          Warning   FailedScheduling          pod/nginx-7854ff8877-k4nqb    0/1 nodes are available: 1 node(s) had untolerated taint {node-role.kubernetes.io/control-plane: }. preemption: 0/1 nodes are available: 1 Preemption is not helpful for scheduling..
5m35s       Normal    Scheduled                 pod/nginx-7854ff8877-k4nqb    Successfully assigned default/nginx-7854ff8877-k4nqb to ip-172-31-40-74
5m34s       Normal    Pulling                   pod/nginx-7854ff8877-k4nqb    Pulling image "nginx"
5m28s       Normal    Pulled                    pod/nginx-7854ff8877-k4nqb    Successfully pulled image "nginx" in 6.032s (6.032s including waiting)
5m28s       Normal    Created                   pod/nginx-7854ff8877-k4nqb    Created container nginx
5m28s       Normal    Started                   pod/nginx-7854ff8877-k4nqb    Started container nginx
5m3s        Normal    Killing                   pod/nginx-7854ff8877-k4nqb    Stopping container nginx
8m          Normal    SuccessfulCreate          replicaset/nginx-7854ff8877   Created pod: nginx-7854ff8877-k4nqb
3m50s       Normal    SuccessfulCreate          replicaset/nginx-7854ff8877   Created pod: nginx-7854ff8877-jdbnw
8m          Normal    ScalingReplicaSet         deployment/nginx              Scaled up replica set nginx-7854ff8877 to 1
3m50s       Normal    ScalingReplicaSet         deployment/nginx              Scaled up replica set nginx-7854ff8877 to 1
ubuntu@ip-172-31-40-74:~$ kubectl get deployment nginx
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
nginx   1/1     1            1           5m
ubuntu@ip-172-31-40-74:~$ kubectl get deployment nginx -o wide
NAME    READY   UP-TO-DATE   AVAILABLE   AGE     CONTAINERS   IMAGES   SELECTOR
nginx   1/1     1            1           5m17s   nginx        nginx    app=nginx
ubuntu@ip-172-31-40-74:~$ kubectl get deployment nginx -o yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations:
    deployment.kubernetes.io/revision: "1"
  creationTimestamp: "2024-03-19T11:13:13Z"
  generation: 1
  labels:
    app: nginx
  name: nginx
  namespace: default
  resourceVersion: "6509"
  uid: 01cf217b-c4bc-4a50-9737-be3a7f2c34d3
spec:
  progressDeadlineSeconds: 600
  replicas: 1
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      app: nginx
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: nginx
    spec:
      containers:
      - image: nginx
        imagePullPolicy: Always
        name: nginx
        resources: {}
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
      dnsPolicy: ClusterFirst
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext: {}
      terminationGracePeriodSeconds: 30
status:
  availableReplicas: 1
  conditions:
  - lastTransitionTime: "2024-03-19T11:13:15Z"
    lastUpdateTime: "2024-03-19T11:13:15Z"
    message: Deployment has minimum availability.
    reason: MinimumReplicasAvailable
    status: "True"
    type: Available
  - lastTransitionTime: "2024-03-19T11:13:13Z"
    lastUpdateTime: "2024-03-19T11:13:15Z"
    message: ReplicaSet "nginx-7854ff8877" has successfully progressed.
    reason: NewReplicaSetAvailable
    status: "True"
    type: Progressing
  observedGeneration: 1
  readyReplicas: 1
  replicas: 1
  updatedReplicas: 1
ubuntu@ip-172-31-40-74:~$ kubectl get pods
NAME                     READY   STATUS    RESTARTS   AGE
nginx-7854ff8877-jdbnw   1/1     Running   0          5m39s
ubuntu@ip-172-31-40-74:~$ kubectl get pod nginx-7854ff8877-jdbnw -o wide
NAME                     READY   STATUS    RESTARTS   AGE     IP              NODE              NOMINATED NODE   READINESS GATES
nginx-7854ff8877-jdbnw   1/1     Running   0          5m55s   192.168.10.11   ip-172-31-40-74   <none>           <none>
ubuntu@ip-172-31-40-74:~$ kubectl get pod nginx-7854ff8877-jdbnw -o yaml
apiVersion: v1
kind: Pod
metadata:
  annotations:
    cni.projectcalico.org/containerID: 2adbd58def3c88e3950d74c98ef01240a95507301171ee7accd1e749a7206350
    cni.projectcalico.org/podIP: 192.168.10.11/32
    cni.projectcalico.org/podIPs: 192.168.10.11/32
  creationTimestamp: "2024-03-19T11:13:13Z"
  generateName: nginx-7854ff8877-
  labels:
    app: nginx
    pod-template-hash: 7854ff8877
  name: nginx-7854ff8877-jdbnw
  namespace: default
  ownerReferences:
  - apiVersion: apps/v1
    blockOwnerDeletion: true
    controller: true
    kind: ReplicaSet
    name: nginx-7854ff8877
    uid: 4b7d610b-116a-4289-8d89-3b0fe783efdf
  resourceVersion: "6507"
  uid: fdb94a60-cf4f-4e2e-8429-d42234f426ee
spec:
  containers:
  - image: nginx
    imagePullPolicy: Always
    name: nginx
    resources: {}
    terminationMessagePath: /dev/termination-log
    terminationMessagePolicy: File
    volumeMounts:
    - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      name: kube-api-access-tbd24
      readOnly: true
  dnsPolicy: ClusterFirst
  enableServiceLinks: true
  nodeName: ip-172-31-40-74
  preemptionPolicy: PreemptLowerPriority
  priority: 0
  restartPolicy: Always
  schedulerName: default-scheduler
  securityContext: {}
  serviceAccount: default
  serviceAccountName: default
  terminationGracePeriodSeconds: 30
  tolerations:
  - effect: NoExecute
    key: node.kubernetes.io/not-ready
    operator: Exists
    tolerationSeconds: 300
  - effect: NoExecute
    key: node.kubernetes.io/unreachable
    operator: Exists
    tolerationSeconds: 300
  volumes:
  - name: kube-api-access-tbd24
    projected:
      defaultMode: 420
      sources:
      - serviceAccountToken:
          expirationSeconds: 3607
          path: token
      - configMap:
          items:
          - key: ca.crt
            path: ca.crt
          name: kube-root-ca.crt
      - downwardAPI:
          items:
          - fieldRef:
              apiVersion: v1
              fieldPath: metadata.namespace
            path: namespace
status:
  conditions:
  - lastProbeTime: null
    lastTransitionTime: "2024-03-19T11:13:13Z"
    status: "True"
    type: Initialized
  - lastProbeTime: null
    lastTransitionTime: "2024-03-19T11:13:15Z"
    status: "True"
    type: Ready
  - lastProbeTime: null
    lastTransitionTime: "2024-03-19T11:13:15Z"
    status: "True"
    type: ContainersReady
  - lastProbeTime: null
    lastTransitionTime: "2024-03-19T11:13:13Z"
    status: "True"
    type: PodScheduled
  containerStatuses:
  - containerID: containerd://7a727e47f073281593c7c176548b8556ac57c318364892d772df697d1b62c65e
    image: docker.io/library/nginx:latest
    imageID: docker.io/library/nginx@sha256:6db391d1c0cfb30588ba0bf72ea999404f2764febf0f1f196acd5867ac7efa7e
    lastState: {}
    name: nginx
    ready: true
    restartCount: 0
    started: true
    state:
      running:
        startedAt: "2024-03-19T11:13:14Z"
  hostIP: 172.31.40.74
  phase: Running
  podIP: 192.168.10.11
  podIPs:
  - ip: 192.168.10.11
  qosClass: BestEffort
  startTime: "2024-03-19T11:13:13Z"
ubuntu@ip-172-31-40-74:~$
ubuntu@ip-172-31-40-74:~$ kubectl create deployment test-dployment --image=redis --dry-run=client -o yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: test-dployment
  name: test-dployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: test-dployment
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: test-dployment
    spec:
      containers:
      - image: redis
        name: redis
        resources: {}
status: {}
ubuntu@ip-172-31-40-74:~$ kubectl get all
NAME                         READY   STATUS    RESTARTS   AGE
pod/nginx-7854ff8877-jdbnw   1/1     Running   0          8m40s

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   20h

NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/nginx   1/1     1            1           8m40s

NAME                               DESIRED   CURRENT   READY   AGE
replicaset.apps/nginx-7854ff8877   1         1         1       8m40s
ubuntu@ip-172-31-40-74:~$ kubectl expose deployment nginx
error: couldn't find port via --port flag or introspection
ubuntu@ip-172-31-40-74:~$ kubectl expose deployment deployment.apps/nginx
error: there is no need to specify a resource type as a separate argument when passing arguments in resource/name form (e.g. 'kubectl get resource/<resource_name>' instead of 'kubectl get resource resource/<resource_name>'
ubuntu@ip-172-31-40-74:~$ kubectl expose deployment nginx --type=LoadBalancer --port=80 --target-port=80
service/nginx exposed
ubuntu@ip-172-31-40-74:~$ kubectl get all
NAME                         READY   STATUS    RESTARTS   AGE
pod/nginx-7854ff8877-jdbnw   1/1     Running   0          11m

NAME                 TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
service/kubernetes   ClusterIP      10.96.0.1      <none>        443/TCP        20h
service/nginx        LoadBalancer   10.97.104.68   <pending>     80:31539/TCP   9s

NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/nginx   1/1     1            1           11m

NAME                               DESIRED   CURRENT   READY   AGE
replicaset.apps/nginx-7854ff8877   1         1         1       11m
ubuntu@ip-172-31-40-74:~$ kubectl get services -o wide
NAME         TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE   SELECTOR
kubernetes   ClusterIP      10.96.0.1      <none>        443/TCP        20h   <none>
nginx        LoadBalancer   10.97.104.68   <pending>     80:31539/TCP   62s   app=nginx
ubuntu@ip-172-31-40-74:~$ kubectl descrobe service nginx
error: unknown command "descrobe" for "kubectl"

Did you mean this?
        describe
ubuntu@ip-172-31-40-74:~$ kubectl describe service nginx
Name:                     nginx
Namespace:                default
Labels:                   app=nginx
Annotations:              <none>
Selector:                 app=nginx
Type:                     LoadBalancer
IP Family Policy:         SingleStack
IP Families:              IPv4
IP:                       10.97.104.68
IPs:                      10.97.104.68
Port:                     <unset>  80/TCP
TargetPort:               80/TCP
NodePort:                 <unset>  31539/TCP
Endpoints:                192.168.10.11:80
Session Affinity:         None
External Traffic Policy:  Cluster
Events:                   <none>
ubuntu@ip-172-31-40-74:~$ kubectl get service nginx -o yaml
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: "2024-03-19T11:25:02Z"
  labels:
    app: nginx
  name: nginx
  namespace: default
  resourceVersion: "7431"
  uid: a9ce9950-43df-4e72-a51a-1b4953b655b5
spec:
  allocateLoadBalancerNodePorts: true
  clusterIP: 10.97.104.68
  clusterIPs:
  - 10.97.104.68
  externalTrafficPolicy: Cluster
  internalTrafficPolicy: Cluster
  ipFamilies:
  - IPv4
  ipFamilyPolicy: SingleStack
  ports:
  - nodePort: 31539
    port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: nginx
  sessionAffinity: None
  type: LoadBalancer
status:
  loadBalancer: {}
ubuntu@ip-172-31-40-74:~$ kubectl get pods
NAME                     READY   STATUS    RESTARTS   AGE
nginx-7854ff8877-jdbnw   1/1     Running   0          14m
ubuntu@ip-172-31-40-74:~$ kubectl get pods nginx-7854ff8877-jdbnw -o yaml
apiVersion: v1
kind: Pod
metadata:
  annotations:
    cni.projectcalico.org/containerID: 2adbd58def3c88e3950d74c98ef01240a95507301171ee7accd1e749a7206350
    cni.projectcalico.org/podIP: 192.168.10.11/32
    cni.projectcalico.org/podIPs: 192.168.10.11/32
  creationTimestamp: "2024-03-19T11:13:13Z"
  generateName: nginx-7854ff8877-
  labels:
    app: nginx
    pod-template-hash: 7854ff8877
  name: nginx-7854ff8877-jdbnw
  namespace: default
  ownerReferences:
  - apiVersion: apps/v1
    blockOwnerDeletion: true
    controller: true
    kind: ReplicaSet
    name: nginx-7854ff8877
    uid: 4b7d610b-116a-4289-8d89-3b0fe783efdf
  resourceVersion: "6507"
  uid: fdb94a60-cf4f-4e2e-8429-d42234f426ee
spec:
  containers:
  - image: nginx
    imagePullPolicy: Always
    name: nginx
    resources: {}
    terminationMessagePath: /dev/termination-log
    terminationMessagePolicy: File
    volumeMounts:
    - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      name: kube-api-access-tbd24
      readOnly: true
  dnsPolicy: ClusterFirst
  enableServiceLinks: true
  nodeName: ip-172-31-40-74
  preemptionPolicy: PreemptLowerPriority
  priority: 0
  restartPolicy: Always
  schedulerName: default-scheduler
  securityContext: {}
  serviceAccount: default
  serviceAccountName: default
  terminationGracePeriodSeconds: 30
  tolerations:
  - effect: NoExecute
    key: node.kubernetes.io/not-ready
    operator: Exists
    tolerationSeconds: 300
  - effect: NoExecute
    key: node.kubernetes.io/unreachable
    operator: Exists
    tolerationSeconds: 300
  volumes:
  - name: kube-api-access-tbd24
    projected:
      defaultMode: 420
      sources:
      - serviceAccountToken:
          expirationSeconds: 3607
          path: token
      - configMap:
          items:
          - key: ca.crt
            path: ca.crt
          name: kube-root-ca.crt
      - downwardAPI:
          items:
          - fieldRef:
              apiVersion: v1
              fieldPath: metadata.namespace
            path: namespace
status:
  conditions:
  - lastProbeTime: null
    lastTransitionTime: "2024-03-19T11:13:13Z"
    status: "True"
    type: Initialized
  - lastProbeTime: null
    lastTransitionTime: "2024-03-19T11:13:15Z"
    status: "True"
    type: Ready
  - lastProbeTime: null
    lastTransitionTime: "2024-03-19T11:13:15Z"
    status: "True"
    type: ContainersReady
  - lastProbeTime: null
    lastTransitionTime: "2024-03-19T11:13:13Z"
    status: "True"
    type: PodScheduled
  containerStatuses:
  - containerID: containerd://7a727e47f073281593c7c176548b8556ac57c318364892d772df697d1b62c65e
    image: docker.io/library/nginx:latest
    imageID: docker.io/library/nginx@sha256:6db391d1c0cfb30588ba0bf72ea999404f2764febf0f1f196acd5867ac7efa7e
    lastState: {}
    name: nginx
    ready: true
    restartCount: 0
    started: true
    state:
      running:
        startedAt: "2024-03-19T11:13:14Z"
  hostIP: 172.31.40.74
  phase: Running
  podIP: 192.168.10.11
  podIPs:
  - ip: 192.168.10.11
  qosClass: BestEffort
  startTime: "2024-03-19T11:13:13Z"
ubuntu@ip-172-31-40-74:~$
ubuntu@ip-172-31-40-74:~$ kubectl get ep nginx
NAME    ENDPOINTS          AGE
nginx   192.168.10.11:80   4m2s
ubuntu@ip-172-31-40-74:~$ curl 192.168.10.11
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
ubuntu@ip-172-31-40-74:~$ kubectl get services -o
error: flag needs an argument: 'o' in -o
See 'kubectl get --help' for usage.
ubuntu@ip-172-31-40-74:~$ kubectl get services -o wide
NAME         TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE     SELECTOR
kubernetes   ClusterIP      10.96.0.1      <none>        443/TCP        20h     <none>
nginx        LoadBalancer   10.97.104.68   <pending>     80:31539/TCP   4m32s   app=nginx
ubuntu@ip-172-31-40-74:~$ kubectl get services -o wide
NAME         TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE     SELECTOR
kubernetes   ClusterIP      10.96.0.1      <none>        443/TCP        20h     <none>
nginx        LoadBalancer   10.97.104.68   <pending>     80:31539/TCP   6m30s   app=nginx
#  #  curl ifconfig.io from your terminal, it fetches the public IP address of the machine you're running the command on and displays it in the terminal output. 
#  #   so i did this and i got the following and when i typed http://34.244.97.39:31539/ i saw nginx welcome page!
ubuntu@ip-172-31-40-74:~$ curl ifconfig.io
34.244.97.39

ubuntu@ip-172-31-40-74:~$ kubectl get pods -n kube-system -o wide
NAME                                       READY   STATUS    RESTARTS      AGE   IP             NODE              NOMINATED NODE   READINESS GATES
calico-kube-controllers-68cdf756d9-sdj2v   1/1     Running   2 (55m ago)   20h   192.168.10.9   ip-172-31-40-74   <none>           <none>
calico-node-m25dv                          1/1     Running   2 (55m ago)   20h   172.31.40.74   ip-172-31-40-74   <none>           <none>
coredns-5dd5756b68-ftqjl                   1/1     Running   2 (55m ago)   20h   192.168.10.7   ip-172-31-40-74   <none>           <none>
coredns-5dd5756b68-mqdtt                   1/1     Running   2 (55m ago)   20h   192.168.10.8   ip-172-31-40-74   <none>           <none>
etcd-ip-172-31-40-74                       1/1     Running   2 (55m ago)   20h   172.31.40.74   ip-172-31-40-74   <none>           <none>
kube-apiserver-ip-172-31-40-74             1/1     Running   2 (55m ago)   20h   172.31.40.74   ip-172-31-40-74   <none>           <none>
kube-controller-manager-ip-172-31-40-74    1/1     Running   2 (55m ago)   20h   172.31.40.74   ip-172-31-40-74   <none>           <none>
kube-proxy-cjl4p                           1/1     Running   2 (55m ago)   20h   172.31.40.74   ip-172-31-40-74   <none>           <none>
kube-scheduler-ip-172-31-40-74             1/1     Running   2 (55m ago)   20h   172.31.40.74   ip-172-31-40-74   <none>           <none>
ubuntu@ip-172-31-40-74:~$ kubectl exec -it etcd-ip-172-31-40-74 -- /bin/sh
Error from server (NotFound): pods "etcd-ip-172-31-40-74" not found
ubuntu@ip-172-31-40-74:~$ kubectl exec -it etcd-ip-172-31-40-74 -- /bin/sh -n kube-system
Error from server (NotFound): pods "etcd-ip-172-31-40-74" not found
ubuntu@ip-172-31-40-74:~$ kubectl get pods -n kube-system
NAME                                       READY   STATUS    RESTARTS      AGE
calico-kube-controllers-68cdf756d9-sdj2v   1/1     Running   2 (57m ago)   20h
calico-node-m25dv                          1/1     Running   2 (57m ago)   20h
coredns-5dd5756b68-ftqjl                   1/1     Running   2 (57m ago)   20h
coredns-5dd5756b68-mqdtt                   1/1     Running   2 (57m ago)   20h
etcd-ip-172-31-40-74                       1/1     Running   2 (57m ago)   20h
kube-apiserver-ip-172-31-40-74             1/1     Running   2 (57m ago)   20h
kube-controller-manager-ip-172-31-40-74    1/1     Running   2 (57m ago)   20h
kube-proxy-cjl4p                           1/1     Running   2 (57m ago)   20h
kube-scheduler-ip-172-31-40-74             1/1     Running   2 (57m ago)   20h
ubuntu@ip-172-31-40-74:~$ kubectl exec -it etcd-ip-172-31-40-74 -n kube-system -- /bin/sh
sh-5.2#   etcdctl get "" --prefix --keys-only

{"level":"warn","ts":"2024-03-19T11:54:35.678605Z","logger":"etcd-client","caller":"v3@v3.5.12/retry_interceptor.go:62","msg":"retrying of unary invoker failed","target":"etcd-endpoints://0xc00033c700/127.0.0.1:2379","attempt":0,"error":"rpc error: code = DeadlineExceeded desc = latest balancer error: last connection error: connection error: desc = \"error reading server preface: EOF\""}
Error: context deadline exceeded
sh-5.2#  
sh-5.2#   export ETCDCTL_API=3
sh-5.2#   export ETCDCTL_ENDPOINTS=https://127.0.0.1:2379
sh-5.2#   etcdctl get "" --prefix --keys-only
{"level":"warn","ts":"2024-03-19T11:54:57.315061Z","logger":"etcd-client","caller":"v3@v3.5.12/retry_interceptor.go:62","msg":"retrying of unary invoker failed","target":"etcd-endpoints://0xc00030e1c0/127.0.0.1:2379","attempt":0,"error":"rpc error: code = DeadlineExceeded desc = latest balancer error: last connection error: connection error: desc = \"transport: authentication handshake failed: tls: failed to verify certificate: x509: certificate signed by unknown authority\""}
Error: context deadline exceeded
sh-5.2#   etcdctl get "" --prefix --keys-only --insecure-transport=true
{"level":"warn","ts":"2024-03-19T11:57:13.746674Z","logger":"etcd-client","caller":"v3@v3.5.12/retry_interceptor.go:62","msg":"retrying of unary invoker failed","target":"etcd-endpoints://0xc00030c1c0/127.0.0.1:2379","attempt":0,"error":"rpc error: code = DeadlineExceeded desc = latest balancer error: last connection error: connection error: desc = \"transport: authentication handshake failed: tls: failed to verify certificate: x509: certificate signed by unknown authority\""}
Error: context deadline exceeded
sh-5.2#   cd /etc/kubernetes/pki/etcd
sh-5.2#   ls
sh: ls: command not found
sh-5.2#   echo *
ca.crt ca.key healthcheck-client.crt healthcheck-client.key peer.crt peer.key server.crt server.key
sh-5.2#   exit
exit
ubuntu@ip-172-31-40-74:~$ ca.crt ca.key healthcheck-client.crt healthcheck-client.key peer.crt peer.key server.crt server.key


kubectl -n kube-system exec -it etcd-ip-172-31-40-74  -- /bin/sh -c "ETCDCTL_API=3 \
ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt \
ETCDCTL_CERT=/etc/kubernetes/pki/etcd/server.crt \
ETCDCTL_KEY=/etc/kubernetes/pki/etcd/server.key \
etcdctl --endpoints=https://127.0.0.1:2379 member list
ca.crt: command not found
> ^C
ubuntu@ip-172-31-40-74:~$ kubectl -n kube-system exec -it etcd-ip-172-31-40-74  -- /bin/sh -c "ETCDCTL_API=3 ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt ETCDCTL_CERT=/etc/kubernetes/pki/etcd/server.crt ETCDCTL_KEY=/etc/kubernetes/pki/etcd/server.key etcdctl --endpoints=https://127.0.0.1:2379 member list"
85b662448f547898, started, ip-172-31-40-74, https://172.31.40.74:2380, https://172.31.40.74:2379, false
ubuntu@ip-172-31-40-74:~$ ca.crt ca.key healthcheck-client.crt healthcheck-client.key peer.crt peer.key server.crt server.key


kubectl -n kube-system exec -it etcd-ip-172-31-40-74  -- /bin/sh -c "ETCDCTL_API=3 ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt ETCDCTL_CERT=/etc/kubernetes/pki/etcd/server.crt ETCDCTL_KEY=/etc/kubernetes/pki/etcd/server.key etcdctl --endpoints=https://127.0.0.1:2379 get "" --prefix --keys-only"
ca.crt: command not found
Error: get command needs one argument as key and an optional argument as range_end
command terminated with exit code 128
ubuntu@ip-172-31-40-74:~$ kubectl exec -it etcd-ip-172-31-40-74 -n kube-system -- /bin/sh                                                                                                                         sh-5.2#   export ETCDCTL_API=3
sh-5.2#   export ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt
sh-5.2#   export ETCDCTL_CERT=/etc/kubernetes/pki/etcd/server.crt
sh-5.2#   export ETCDCTL_KEY=/etc/kubernetes/pki/etcd/server.key
sh-5.2#  
sh-5.2#   etcdctl --endpoints=https://127.0.0.1:2379 get "" --prefix --keys-only
/registry/apiextensions.k8s.io/customresourcedefinitions/bgpconfigurations.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/bgpfilters.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/bgppeers.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/blockaffinities.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/caliconodestatuses.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/clusterinformations.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/felixconfigurations.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/globalnetworkpolicies.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/globalnetworksets.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/hostendpoints.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/ipamblocks.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/ipamconfigs.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/ipamhandles.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/ippools.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/ipreservations.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/kubecontrollersconfigurations.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/networkpolicies.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/networksets.crd.projectcalico.org

/registry/apiregistration.k8s.io/apiservices/v1.

/registry/apiregistration.k8s.io/apiservices/v1.admissionregistration.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.apiextensions.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.apps

/registry/apiregistration.k8s.io/apiservices/v1.authentication.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.authorization.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.autoscaling

/registry/apiregistration.k8s.io/apiservices/v1.batch

/registry/apiregistration.k8s.io/apiservices/v1.certificates.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.coordination.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.crd.projectcalico.org

/registry/apiregistration.k8s.io/apiservices/v1.discovery.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.events.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.networking.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.node.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.policy

/registry/apiregistration.k8s.io/apiservices/v1.rbac.authorization.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.scheduling.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.storage.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1beta2.flowcontrol.apiserver.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1beta3.flowcontrol.apiserver.k8s.io

/registry/apiregistration.k8s.io/apiservices/v2.autoscaling

/registry/clusterrolebindings/calico-cni-plugin

/registry/clusterrolebindings/calico-kube-controllers

/registry/clusterrolebindings/calico-node

/registry/clusterrolebindings/cluster-admin

/registry/clusterrolebindings/kubeadm:get-nodes

/registry/clusterrolebindings/kubeadm:kubelet-bootstrap

/registry/clusterrolebindings/kubeadm:node-autoapprove-bootstrap

/registry/clusterrolebindings/kubeadm:node-autoapprove-certificate-rotation

/registry/clusterrolebindings/kubeadm:node-proxier

/registry/clusterrolebindings/system:basic-user

/registry/clusterrolebindings/system:controller:attachdetach-controller

/registry/clusterrolebindings/system:controller:certificate-controller

/registry/clusterrolebindings/system:controller:clusterrole-aggregation-controller

/registry/clusterrolebindings/system:controller:cronjob-controller

/registry/clusterrolebindings/system:controller:daemon-set-controller

/registry/clusterrolebindings/system:controller:deployment-controller

/registry/clusterrolebindings/system:controller:disruption-controller

/registry/clusterrolebindings/system:controller:endpoint-controller

/registry/clusterrolebindings/system:controller:endpointslice-controller

/registry/clusterrolebindings/system:controller:endpointslicemirroring-controller

/registry/clusterrolebindings/system:controller:ephemeral-volume-controller

/registry/clusterrolebindings/system:controller:expand-controller

/registry/clusterrolebindings/system:controller:generic-garbage-collector

/registry/clusterrolebindings/system:controller:horizontal-pod-autoscaler

/registry/clusterrolebindings/system:controller:job-controller

/registry/clusterrolebindings/system:controller:namespace-controller

/registry/clusterrolebindings/system:controller:node-controller

/registry/clusterrolebindings/system:controller:persistent-volume-binder

/registry/clusterrolebindings/system:controller:pod-garbage-collector

/registry/clusterrolebindings/system:controller:pv-protection-controller

/registry/clusterrolebindings/system:controller:pvc-protection-controller

/registry/clusterrolebindings/system:controller:replicaset-controller

/registry/clusterrolebindings/system:controller:replication-controller

/registry/clusterrolebindings/system:controller:resourcequota-controller

/registry/clusterrolebindings/system:controller:root-ca-cert-publisher

/registry/clusterrolebindings/system:controller:route-controller

/registry/clusterrolebindings/system:controller:service-account-controller

/registry/clusterrolebindings/system:controller:service-controller

/registry/clusterrolebindings/system:controller:statefulset-controller

/registry/clusterrolebindings/system:controller:ttl-after-finished-controller

/registry/clusterrolebindings/system:controller:ttl-controller

/registry/clusterrolebindings/system:coredns

/registry/clusterrolebindings/system:discovery

/registry/clusterrolebindings/system:kube-controller-manager

/registry/clusterrolebindings/system:kube-dns

/registry/clusterrolebindings/system:kube-scheduler

/registry/clusterrolebindings/system:monitoring

/registry/clusterrolebindings/system:node

/registry/clusterrolebindings/system:node-proxier

/registry/clusterrolebindings/system:public-info-viewer

/registry/clusterrolebindings/system:service-account-issuer-discovery

/registry/clusterrolebindings/system:volume-scheduler

/registry/clusterroles/admin

/registry/clusterroles/calico-cni-plugin

/registry/clusterroles/calico-kube-controllers

/registry/clusterroles/calico-node

/registry/clusterroles/cluster-admin

/registry/clusterroles/edit

/registry/clusterroles/kubeadm:get-nodes

/registry/clusterroles/system:aggregate-to-admin

/registry/clusterroles/system:aggregate-to-edit

/registry/clusterroles/system:aggregate-to-view

/registry/clusterroles/system:auth-delegator

/registry/clusterroles/system:basic-user

/registry/clusterroles/system:certificates.k8s.io:certificatesigningrequests:nodeclient

/registry/clusterroles/system:certificates.k8s.io:certificatesigningrequests:selfnodeclient

/registry/clusterroles/system:certificates.k8s.io:kube-apiserver-client-approver

/registry/clusterroles/system:certificates.k8s.io:kube-apiserver-client-kubelet-approver

/registry/clusterroles/system:certificates.k8s.io:kubelet-serving-approver

/registry/clusterroles/system:certificates.k8s.io:legacy-unknown-approver

/registry/clusterroles/system:controller:attachdetach-controller

/registry/clusterroles/system:controller:certificate-controller

/registry/clusterroles/system:controller:clusterrole-aggregation-controller

/registry/clusterroles/system:controller:cronjob-controller

/registry/clusterroles/system:controller:daemon-set-controller

/registry/clusterroles/system:controller:deployment-controller

/registry/clusterroles/system:controller:disruption-controller

/registry/clusterroles/system:controller:endpoint-controller

/registry/clusterroles/system:controller:endpointslice-controller

/registry/clusterroles/system:controller:endpointslicemirroring-controller

/registry/clusterroles/system:controller:ephemeral-volume-controller

/registry/clusterroles/system:controller:expand-controller

/registry/clusterroles/system:controller:generic-garbage-collector

/registry/clusterroles/system:controller:horizontal-pod-autoscaler

/registry/clusterroles/system:controller:job-controller

/registry/clusterroles/system:controller:namespace-controller

/registry/clusterroles/system:controller:node-controller

/registry/clusterroles/system:controller:persistent-volume-binder

/registry/clusterroles/system:controller:pod-garbage-collector

/registry/clusterroles/system:controller:pv-protection-controller

/registry/clusterroles/system:controller:pvc-protection-controller

/registry/clusterroles/system:controller:replicaset-controller

/registry/clusterroles/system:controller:replication-controller

/registry/clusterroles/system:controller:resourcequota-controller

/registry/clusterroles/system:controller:root-ca-cert-publisher

/registry/clusterroles/system:controller:route-controller

/registry/clusterroles/system:controller:service-account-controller

/registry/clusterroles/system:controller:service-controller

/registry/clusterroles/system:controller:statefulset-controller

/registry/clusterroles/system:controller:ttl-after-finished-controller

/registry/clusterroles/system:controller:ttl-controller

/registry/clusterroles/system:coredns

/registry/clusterroles/system:discovery

/registry/clusterroles/system:heapster

/registry/clusterroles/system:kube-aggregator

/registry/clusterroles/system:kube-controller-manager

/registry/clusterroles/system:kube-dns

/registry/clusterroles/system:kube-scheduler

/registry/clusterroles/system:kubelet-api-admin

/registry/clusterroles/system:monitoring

/registry/clusterroles/system:node

/registry/clusterroles/system:node-bootstrapper

/registry/clusterroles/system:node-problem-detector

/registry/clusterroles/system:node-proxier

/registry/clusterroles/system:persistent-volume-provisioner

/registry/clusterroles/system:public-info-viewer

/registry/clusterroles/system:service-account-issuer-discovery

/registry/clusterroles/system:volume-scheduler

/registry/clusterroles/view

/registry/configmaps/default/kube-root-ca.crt

/registry/configmaps/kube-node-lease/kube-root-ca.crt

/registry/configmaps/kube-public/cluster-info

/registry/configmaps/kube-public/kube-root-ca.crt

/registry/configmaps/kube-system/calico-config

/registry/configmaps/kube-system/coredns

/registry/configmaps/kube-system/extension-apiserver-authentication

/registry/configmaps/kube-system/kube-apiserver-legacy-service-account-token-tracking

/registry/configmaps/kube-system/kube-proxy

/registry/configmaps/kube-system/kube-root-ca.crt

/registry/configmaps/kube-system/kubeadm-config

/registry/configmaps/kube-system/kubelet-config

/registry/controllerrevisions/kube-system/calico-node-588966dd55

/registry/controllerrevisions/kube-system/kube-proxy-67cb99b4b

/registry/crd.projectcalico.org/blockaffinities/ip-172-31-40-74-192-168-10-0-26

/registry/crd.projectcalico.org/clusterinformations/default

/registry/crd.projectcalico.org/felixconfigurations/default

/registry/crd.projectcalico.org/ipamblocks/192-168-10-0-26

/registry/crd.projectcalico.org/ipamconfigs/default

/registry/crd.projectcalico.org/ipamhandles/ipip-tunnel-addr-ip-172-31-40-74

/registry/crd.projectcalico.org/ipamhandles/k8s-pod-network.56e5e7993274ebaa5394ea2caba9fcbbcde1cfacae3f9162e7da1656005aa96c

/registry/crd.projectcalico.org/ipamhandles/k8s-pod-network.992cf5e9f66486e686dee656abc2d84e9cc0615ee986f8c26ac75de63898c9a9

/registry/crd.projectcalico.org/ipamhandles/k8s-pod-network.a3c89c3f3aa75bdaf4873b232c2515a56282c97fe19b8dd946a11c6c9903ec70

/registry/crd.projectcalico.org/ippools/default-ipv4-ippool

/registry/crd.projectcalico.org/kubecontrollersconfigurations/default

/registry/csinodes/ip-172-31-40-74

/registry/daemonsets/kube-system/calico-node

/registry/daemonsets/kube-system/kube-proxy

/registry/deployments/kube-system/calico-kube-controllers

/registry/deployments/kube-system/coredns

/registry/endpointslices/default/kubernetes

/registry/endpointslices/kube-system/kube-dns-7vbkn

/registry/events/default/nginx-7854ff8877-jdbnw.17be26182088a1db

/registry/events/default/nginx-7854ff8877-jdbnw.17be26184179d8d1

/registry/events/default/nginx-7854ff8877-jdbnw.17be2618653b0f81

/registry/events/default/nginx-7854ff8877-jdbnw.17be2618666f1469

/registry/events/default/nginx-7854ff8877-jdbnw.17be26186a3a268d

/registry/events/default/nginx-7854ff8877-jdbnw.17be27c2ab07b43f

/registry/events/default/nginx-7854ff8877-k4nqb.17be25de017b0611

/registry/events/default/nginx-7854ff8877-k4nqb.17be25ffabd2a8e0

/registry/events/default/nginx-7854ff8877-k4nqb.17be25ffcf883485

/registry/events/default/nginx-7854ff8877-k4nqb.17be2601371451bb

/registry/events/default/nginx-7854ff8877-k4nqb.17be2601386ade2a

/registry/events/default/nginx-7854ff8877-k4nqb.17be26013c9c430c

/registry/events/default/nginx-7854ff8877-k4nqb.17be26070c18f9b9

/registry/events/default/nginx-7854ff8877.17be25de014da7e9

/registry/events/default/nginx-7854ff8877.17be26181f479302

/registry/events/default/nginx.17be25de00add5c5

/registry/events/default/nginx.17be26181ebe1d87

/registry/flowschemas/catch-all

/registry/flowschemas/endpoint-controller

/registry/flowschemas/exempt

/registry/flowschemas/global-default

/registry/flowschemas/kube-controller-manager

/registry/flowschemas/kube-scheduler

/registry/flowschemas/kube-system-service-accounts

/registry/flowschemas/probes

/registry/flowschemas/service-accounts

/registry/flowschemas/system-leader-election

/registry/flowschemas/system-node-high

/registry/flowschemas/system-nodes

/registry/flowschemas/workload-leader-election

/registry/leases/kube-node-lease/ip-172-31-40-74

/registry/leases/kube-system/apiserver-a6qcmcfoeurupmyoruuyrbv2dy

/registry/leases/kube-system/kube-controller-manager

/registry/leases/kube-system/kube-scheduler

/registry/masterleases/172.31.40.74

/registry/minions/ip-172-31-40-74

/registry/namespaces/default

/registry/namespaces/kube-node-lease

/registry/namespaces/kube-public

/registry/namespaces/kube-system

/registry/poddisruptionbudgets/kube-system/calico-kube-controllers

/registry/pods/kube-system/calico-kube-controllers-68cdf756d9-sdj2v

/registry/pods/kube-system/calico-node-m25dv

/registry/pods/kube-system/coredns-5dd5756b68-ftqjl

/registry/pods/kube-system/coredns-5dd5756b68-mqdtt

/registry/pods/kube-system/etcd-ip-172-31-40-74

/registry/pods/kube-system/kube-apiserver-ip-172-31-40-74

/registry/pods/kube-system/kube-controller-manager-ip-172-31-40-74

/registry/pods/kube-system/kube-proxy-cjl4p

/registry/pods/kube-system/kube-scheduler-ip-172-31-40-74

/registry/priorityclasses/system-cluster-critical

/registry/priorityclasses/system-node-critical

/registry/prioritylevelconfigurations/catch-all

/registry/prioritylevelconfigurations/exempt

/registry/prioritylevelconfigurations/global-default

/registry/prioritylevelconfigurations/leader-election

/registry/prioritylevelconfigurations/node-high

/registry/prioritylevelconfigurations/system

/registry/prioritylevelconfigurations/workload-high

/registry/prioritylevelconfigurations/workload-low

/registry/ranges/serviceips

/registry/ranges/servicenodeports

/registry/replicasets/kube-system/calico-kube-controllers-68cdf756d9

/registry/replicasets/kube-system/coredns-5dd5756b68

/registry/rolebindings/kube-public/kubeadm:bootstrap-signer-clusterinfo

/registry/rolebindings/kube-public/system:controller:bootstrap-signer

/registry/rolebindings/kube-system/kube-proxy

/registry/rolebindings/kube-system/kubeadm:kubeadm-certs

/registry/rolebindings/kube-system/kubeadm:kubelet-config

/registry/rolebindings/kube-system/kubeadm:nodes-kubeadm-config

/registry/rolebindings/kube-system/system::extension-apiserver-authentication-reader

/registry/rolebindings/kube-system/system::leader-locking-kube-controller-manager

/registry/rolebindings/kube-system/system::leader-locking-kube-scheduler

/registry/rolebindings/kube-system/system:controller:bootstrap-signer

/registry/rolebindings/kube-system/system:controller:cloud-provider

/registry/rolebindings/kube-system/system:controller:token-cleaner

/registry/roles/kube-public/kubeadm:bootstrap-signer-clusterinfo

/registry/roles/kube-public/system:controller:bootstrap-signer

/registry/roles/kube-system/extension-apiserver-authentication-reader

/registry/roles/kube-system/kube-proxy

/registry/roles/kube-system/kubeadm:kubeadm-certs

/registry/roles/kube-system/kubeadm:kubelet-config

/registry/roles/kube-system/kubeadm:nodes-kubeadm-config

/registry/roles/kube-system/system::leader-locking-kube-controller-manager

/registry/roles/kube-system/system::leader-locking-kube-scheduler

/registry/roles/kube-system/system:controller:bootstrap-signer

/registry/roles/kube-system/system:controller:cloud-provider

/registry/roles/kube-system/system:controller:token-cleaner

/registry/secrets/kube-system/bootstrap-token-p00aag

/registry/secrets/kube-system/bootstrap-token-phkbo0

/registry/secrets/kube-system/bootstrap-token-yzxc97

/registry/serviceaccounts/default/default

/registry/serviceaccounts/kube-node-lease/default

/registry/serviceaccounts/kube-public/default

/registry/serviceaccounts/kube-system/attachdetach-controller

/registry/serviceaccounts/kube-system/bootstrap-signer

/registry/serviceaccounts/kube-system/calico-cni-plugin

/registry/serviceaccounts/kube-system/calico-kube-controllers

/registry/serviceaccounts/kube-system/calico-node

/registry/serviceaccounts/kube-system/certificate-controller

/registry/serviceaccounts/kube-system/clusterrole-aggregation-controller

/registry/serviceaccounts/kube-system/coredns

/registry/serviceaccounts/kube-system/cronjob-controller

/registry/serviceaccounts/kube-system/daemon-set-controller

/registry/serviceaccounts/kube-system/default

/registry/serviceaccounts/kube-system/deployment-controller

/registry/serviceaccounts/kube-system/disruption-controller

/registry/serviceaccounts/kube-system/endpoint-controller

/registry/serviceaccounts/kube-system/endpointslice-controller

/registry/serviceaccounts/kube-system/endpointslicemirroring-controller

/registry/serviceaccounts/kube-system/ephemeral-volume-controller

/registry/serviceaccounts/kube-system/expand-controller

/registry/serviceaccounts/kube-system/generic-garbage-collector

/registry/serviceaccounts/kube-system/horizontal-pod-autoscaler

/registry/serviceaccounts/kube-system/job-controller

/registry/serviceaccounts/kube-system/kube-proxy

/registry/serviceaccounts/kube-system/namespace-controller

/registry/serviceaccounts/kube-system/node-controller

/registry/serviceaccounts/kube-system/persistent-volume-binder

/registry/serviceaccounts/kube-system/pod-garbage-collector

/registry/serviceaccounts/kube-system/pv-protection-controller

/registry/serviceaccounts/kube-system/pvc-protection-controller

/registry/serviceaccounts/kube-system/replicaset-controller

/registry/serviceaccounts/kube-system/replication-controller

/registry/serviceaccounts/kube-system/resourcequota-controller

/registry/serviceaccounts/kube-system/root-ca-cert-publisher

/registry/serviceaccounts/kube-system/service-account-controller

/registry/serviceaccounts/kube-system/service-controller

/registry/serviceaccounts/kube-system/statefulset-controller

/registry/serviceaccounts/kube-system/token-cleaner

/registry/serviceaccounts/kube-system/ttl-after-finished-controller

/registry/serviceaccounts/kube-system/ttl-controller

/registry/services/endpoints/default/kubernetes

/registry/services/endpoints/kube-system/kube-dns

/registry/services/specs/default/kubernetes

/registry/services/specs/kube-system/kube-dns

compact_rev_key

sh-5.2#  
sh-5.2#  
