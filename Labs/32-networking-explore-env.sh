kubectl get nodes -o wide

ip link show
#  1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
#      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
#  2: flannel.1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UNKNOWN mode DEFAULT group default
#      link/ether be:cb:b1:bc:57:c6 brd ff:ff:ff:ff:ff:ff
#  3: cni0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP mode DEFAULT group default qlen 1000
#      link/ether ce:20:54:80:c6:6c brd ff:ff:ff:ff:ff:ff
#  4: veth50e87d52@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue master cni0 state UP mode DEFAULT group default
#      link/ether 76:9c:7e:27:f0:35 brd ff:ff:ff:ff:ff:ff link-netns cni-b0ccf98c-85f3-5a2c-20d7-eafa47c6fc7a
#  5: veth01b630bb@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue master cni0 state UP mode DEFAULT group default
#      link/ether b2:45:3b:98:0a:49 brd ff:ff:ff:ff:ff:ff link-netns cni-4ef6d342-4a47-7e35-6e61-66f640da6254
#  10056: eth0@if10057: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP mode DEFAULT group default
#      link/ether 02:42:c0:20:62:09 brd ff:ff:ff:ff:ff:ff link-netnsid 0
#  10058: eth1@if10059: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default
#      link/ether 02:42:ac:19:00:5b brd ff:ff:ff:ff:ff:ff link-netnsid 1

ifconfig -a
#  cni0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1450
#          inet 10.244.0.1  netmask 255.255.255.0  broadcast 10.244.0.255
#          ether ce:20:54:80:c6:6c  txqueuelen 1000  (Ethernet)
#          RX packets 975  bytes 79738 (79.7 KB)
#          RX errors 0  dropped 0  overruns 0  frame 0
#          TX packets 965  bytes 114012 (114.0 KB)
#          TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
#  
#  eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1450
#          inet 192.32.98.9  netmask 255.255.255.0  broadcast 192.32.98.255
#          ether 02:42:c0:20:62:09  txqueuelen 0  (Ethernet)
#          RX packets 2413  bytes 294801 (294.8 KB)
#          RX errors 0  dropped 0  overruns 0  frame 0
#          TX packets 1856  bytes 1206440 (1.2 MB)
#          TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
#  
#  eth1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
#          inet 172.25.0.91  netmask 255.255.255.0  broadcast 172.25.0.255
#          ether 02:42:ac:19:00:5b  txqueuelen 0  (Ethernet)
#          RX packets 1894  bytes 17190482 (17.1 MB)
#          RX errors 0  dropped 0  overruns 0  frame 0
#          TX packets 1677  bytes 134303 (134.3 KB)
#          TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
#  
#  flannel.1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1450
#          inet 10.244.0.0  netmask 255.255.255.255  broadcast 0.0.0.0
#          ether be:cb:b1:bc:57:c6  txqueuelen 0  (Ethernet)
#          RX packets 0  bytes 0 (0.0 B)
#          RX errors 0  dropped 0  overruns 0  frame 0
#          TX packets 0  bytes 0 (0.0 B)
#          TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
#  
#  lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
#          inet 127.0.0.1  netmask 255.0.0.0
#          loop  txqueuelen 1000  (Local Loopback)
#          RX packets 97609  bytes 21912686 (21.9 MB)
#          RX errors 0  dropped 0  overruns 0  frame 0
#          TX packets 97609  bytes 21912686 (21.9 MB)
#          TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
#  
#  veth01b630bb: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1450
#          ether b2:45:3b:98:0a:49  txqueuelen 0  (Ethernet)
#          RX packets 485  bytes 46372 (46.3 KB)
#          RX errors 0  dropped 0  overruns 0  frame 0
#          TX packets 495  bytes 56639 (56.6 KB)
#          TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
#  
#  veth50e87d52: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1450
#          ether 76:9c:7e:27:f0:35  txqueuelen 0  (Ethernet)
#          RX packets 492  bytes 47100 (47.1 KB)
#          RX errors 0  dropped 0  overruns 0  frame 0
#          TX packets 512  bytes 60469 (60.4 KB)
#          TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
#  
#  


ip a
#  
#  1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
#      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
#      inet 127.0.0.1/8 scope host lo
#         valid_lft forever preferred_lft forever
#  2: flannel.1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UNKNOWN group default
#      link/ether be:cb:b1:bc:57:c6 brd ff:ff:ff:ff:ff:ff
#      inet 10.244.0.0/32 scope global flannel.1
#         valid_lft forever preferred_lft forever
#  3: cni0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP group default qlen 1000
#      link/ether ce:20:54:80:c6:6c brd ff:ff:ff:ff:ff:ff
#      inet 10.244.0.1/24 brd 10.244.0.255 scope global cni0
#         valid_lft forever preferred_lft forever
#  4: veth50e87d52@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue master cni0 state UP group default
#      link/ether 76:9c:7e:27:f0:35 brd ff:ff:ff:ff:ff:ff link-netns cni-b0ccf98c-85f3-5a2c-20d7-eafa47c6fc7a
#  5: veth01b630bb@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue master cni0 state UP group default
#      link/ether b2:45:3b:98:0a:49 brd ff:ff:ff:ff:ff:ff link-netns cni-4ef6d342-4a47-7e35-6e61-66f640da6254
#  10056: eth0@if10057: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP group default
#      link/ether 02:42:c0:20:62:09 brd ff:ff:ff:ff:ff:ff link-netnsid 0
#      inet 192.32.98.9/24 brd 192.32.98.255 scope global eth0
#         valid_lft forever preferred_lft forever
#  10058: eth1@if10059: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default
#      link/ether 02:42:ac:19:00:5b brd ff:ff:ff:ff:ff:ff link-netnsid 1
#      inet 172.25.0.91/24 brd 172.25.0.255 scope global eth1
#         valid_lft forever preferred_lft forever

ifconfig -a | grep "192.32.98.9"

ip a | grep "192.32.98.9"

ip a | grep "192.32.98.12"

kubectl describe node node01
#  Name:               node01
#  Lease:
#    HolderIdentity:  node01
#  Conditions:
#    Type                 Status  LastHeartbeatTime                 LastTransitionTime                Reason                       Message
#    ----                 ------  -----------------                 ------------------                ------                       -------
#    NetworkUnavailable   False   Mon, 08 Apr 2024 16:42:34 +0000   Mon, 08 Apr 2024 16:42:34 +0000   FlannelIsUp                  Flannel is running on this node
#    MemoryPressure       False   Mon, 08 Apr 2024 16:53:12 +0000   Mon, 08 Apr 2024 16:42:28 +0000   KubeletHasSufficientMemory   kubelet has sufficient memory available
#    DiskPressure         False   Mon, 08 Apr 2024 16:53:12 +0000   Mon, 08 Apr 2024 16:42:28 +0000   KubeletHasNoDiskPressure     kubelet has no disk pressure
#    PIDPressure          False   Mon, 08 Apr 2024 16:53:12 +0000   Mon, 08 Apr 2024 16:42:28 +0000   KubeletHasSufficientPID      kubelet has sufficient PID available
#    Ready                True    Mon, 08 Apr 2024 16:53:12 +0000   Mon, 08 Apr 2024 16:42:32 +0000   KubeletReady                 kubelet is posting ready status
#  Addresses:
#    InternalIP:  192.32.98.12
#    Hostname:    node01
#  Capacity:
#    cpu:                36
#    ephemeral-storage:  1016057248Ki
#    hugepages-1Gi:      0
#    hugepages-2Mi:      0
#    memory:             214587048Ki
#    pods:               110
#  Allocatable:
#    cpu:                36
#    ephemeral-storage:  936398358207
#    hugepages-1Gi:      0
#    hugepages-2Mi:      0
#    memory:             214484648Ki
#    pods:               110
#  System Info:
#    Machine ID:                 49e48c9673ca44dd919fd32b36f0e237
#    System UUID:                7b3d3688-ece8-71b8-31c0-69d536fbee83
#    Boot ID:                    4d0553ef-e192-4c89-a533-c8180539ef79
#    Kernel Version:             5.4.0-1106-gcp
#    OS Image:                   Ubuntu 22.04.3 LTS
#    Operating System:           linux
#    Architecture:               amd64
#    Container Runtime Version:  containerd://1.6.26
#    Kubelet Version:            v1.29.0
#    Kube-Proxy Version:         v1.29.0
#  PodCIDR:                      10.244.1.0/24
#  PodCIDRs:                     10.244.1.0/24
#  Non-terminated Pods:          (2 in total)
#    Namespace                   Name                     CPU Requests  CPU Limits  Memory Requests  Memory Limits  Age
#    ---------                   ----                     ------------  ----------  ---------------  -------------  ---
#    kube-flannel                kube-flannel-ds-tkrp4    100m (0%)     0 (0%)      50Mi (0%)        0 (0%)         10m
#    kube-system                 kube-proxy-l62gc         0 (0%)        0 (0%)      0 (0%)           0 (0%)         10m
#  Allocated resources:
#    (Total limits may be over 100 percent, i.e., overcommitted.)
#    Resource           Requests   Limits
#    --------           --------   ------
#    cpu                100m (0%)  0 (0%)
#    memory             50Mi (0%)  0 (0%)
#    ephemeral-storage  0 (0%)     0 (0%)
#    hugepages-1Gi      0 (0%)     0 (0%)
#    hugepages-2Mi      0 (0%)     0 (0%)
#  Events:
#    Type     Reason                   Age                From             Message
#    ----     ------                   ----               ----             -------
#    Normal   Starting                 10m                kube-proxy
#    Normal   Starting                 10m                kubelet          Starting kubelet.
#    Warning  InvalidDiskCapacity      10m                kubelet          invalid capacity 0 on image filesystem
#    Normal   NodeHasSufficientMemory  10m (x2 over 10m)  kubelet          Node node01 status is now: NodeHasSufficientMemory
#    Normal   NodeHasNoDiskPressure    10m (x2 over 10m)  kubelet          Node node01 status is now: NodeHasNoDiskPressure
#    Normal   NodeHasSufficientPID     10m (x2 over 10m)  kubelet          Node node01 status is now: NodeHasSufficientPID
#    Normal   RegisteredNode           10m                node-controller  Node node01 event: Registered Node node01 in Controller
#    Normal   NodeAllocatableEnforced  10m                kubelet          Updated Node Allocatable limit across pods
#    Normal   NodeReady                10m                kubelet          Node node01 status is now: NodeReady
#  
ssh node01

ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: flannel.1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UNKNOWN group default
    link/ether be:f4:df:f0:86:3d brd ff:ff:ff:ff:ff:ff
    inet 10.244.1.0/32 scope global flannel.1
       valid_lft forever preferred_lft forever
12370: eth0@if12371: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP group default
    link/ether 02:42:c0:20:62:0c brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 192.32.98.12/24 brd 192.32.98.255 scope global eth0
       valid_lft forever preferred_lft forever
12372: eth1@if12373: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default
    link/ether 02:42:ac:19:00:60 brd ff:ff:ff:ff:ff:ff link-netnsid 1
    inet 172.25.0.96/24 brd 172.25.0.255 scope global eth1
       valid_lft forever preferred_lft forever

node01 ~ ➜  exit
#  logout
#  Connection to node01 closed.

ip link show

#  1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
#      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
#  2: flannel.1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UNKNOWN mode DEFAULT group default
#      link/ether be:cb:b1:bc:57:c6 brd ff:ff:ff:ff:ff:ff
#  3: cni0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP mode DEFAULT group default qlen 1000
#      link/ether ce:20:54:80:c6:6c brd ff:ff:ff:ff:ff:ff
#  4: veth50e87d52@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue master cni0 state UP mode DEFAULT group default
#      link/ether 76:9c:7e:27:f0:35 brd ff:ff:ff:ff:ff:ff link-netns cni-b0ccf98c-85f3-5a2c-20d7-eafa47c6fc7a
#  5: veth01b630bb@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue master cni0 state UP mode DEFAULT group default
#      link/ether b2:45:3b:98:0a:49 brd ff:ff:ff:ff:ff:ff link-netns cni-4ef6d342-4a47-7e35-6e61-66f640da6254
#  10056: eth0@if10057: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP mode DEFAULT group default
#      link/ether 02:42:c0:20:62:09 brd ff:ff:ff:ff:ff:ff link-netnsid 0
#  10058: eth1@if10059: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default
#      link/ether 02:42:ac:19:00:5b brd ff:ff:ff:ff:ff:ff link-netnsid 1
#  


ip route show

#  default via 172.25.0.1 dev eth1
#  10.244.0.0/24 dev cni0 proto kernel scope link src 10.244.0.1
#  10.244.1.0/24 via 10.244.1.0 dev flannel.1 onlink
#  172.25.0.0/24 dev eth1 proto kernel scope link src 172.25.0.91
#  192.32.98.0/24 dev eth0 proto kernel scope link src 192.32.98.9

kubectl get pods -n kube-system -o wide

#  NAME                                   READY   STATUS    RESTARTS   AGE   IP             NODE           NOMINATED NODE   READINESS GATES
#  coredns-69f9c977-s6x8z                 1/1     Running   0          16m   10.244.0.3     controlplane   <none>           <none>
#  coredns-69f9c977-x5tsh                 1/1     Running   0          16m   10.244.0.2     controlplane   <none>           <none>
#  etcd-controlplane                      1/1     Running   0          16m   192.32.98.9    controlplane   <none>           <none>
#  kube-apiserver-controlplane            1/1     Running   0          16m   192.32.98.9    controlplane   <none>           <none>
#  kube-controller-manager-controlplane   1/1     Running   0          16m   192.32.98.9    controlplane   <none>           <none>
#  kube-proxy-l62gc                       1/1     Running   0          15m   192.32.98.12   node01         <none>           <none>
#  kube-proxy-zxml5                       1/1     Running   0          16m   192.32.98.9    controlplane   <none>           <none>
#  kube-scheduler-controlplane            1/1     Running   0          16m   192.32.98.9    controlplane   <none>           <none>
#  

kubectl describe pod kube-scheduler-controlplane  -n kube-system | grep ports

kubectl describe pod kube-scheduler-controlplane  -n kube-system

#  Name:                 kube-scheduler-controlplane
#  Namespace:            kube-system
#  Priority:             2000001000
#  Priority Class Name:  system-node-critical
#  Node:                 controlplane/192.32.98.9
#  Start Time:           Mon, 08 Apr 2024 16:41:53 +0000
#  Labels:               component=kube-scheduler
#                        tier=control-plane
#  Annotations:          kubernetes.io/config.hash: a0ab55e596fb42a62fb1d044490e763d
#                        kubernetes.io/config.mirror: a0ab55e596fb42a62fb1d044490e763d
#                        kubernetes.io/config.seen: 2024-04-08T16:41:53.009416383Z
#                        kubernetes.io/config.source: file
#  Status:               Running
#  SeccompProfile:       RuntimeDefault
#  IP:                   192.32.98.9
#  IPs:
#    IP:           192.32.98.9
#  Controlled By:  Node/controlplane
#  Containers:
#    kube-scheduler:
#      Container ID:  containerd://f229672ec2dad1e7498d43c4155317acdc1e8d48541e34a0c2a6cf5710f11956
#      Image:         registry.k8s.io/kube-scheduler:v1.29.0
#      Image ID:      registry.k8s.io/kube-scheduler@sha256:5df310234e4f9463b15d166778d697830a51c0037ff28a1759daaad2d3cde991
#      Port:          <none>
#      Host Port:     <none>
#      Command:
#        kube-scheduler
#        --authentication-kubeconfig=/etc/kubernetes/scheduler.conf
#        --authorization-kubeconfig=/etc/kubernetes/scheduler.conf
#        --bind-address=127.0.0.1
#        --kubeconfig=/etc/kubernetes/scheduler.conf
#        --leader-elect=true
#      State:          Running
#        Started:      Mon, 08 Apr 2024 16:41:42 +0000
#      Ready:          True
#      Restart Count:  0
#      Requests:
#        cpu:        100m
#      Liveness:     http-get https://127.0.0.1:10259/healthz delay=10s timeout=15s period=10s #  success=1 #  failure=8
#      Startup:      http-get https://127.0.0.1:10259/healthz delay=10s timeout=15s period=10s #  success=1 #  failure=24
#      Environment:  <none>
#      Mounts:
#        /etc/kubernetes/scheduler.conf from kubeconfig (ro)
#  Conditions:
#    Type                        Status
#    PodReadyToStartContainers   True
#    Initialized                 True
#    Ready                       True
#    ContainersReady             True
#    PodScheduled                True
#  Volumes:
#    kubeconfig:
#      Type:          HostPath (bare host directory volume)
#      Path:          /etc/kubernetes/scheduler.conf
#      HostPathType:  FileOrCreate
#  QoS Class:         Burstable
#  Node-Selectors:    <none>
#  Tolerations:       :NoExecute op=Exists
#  Events:
#    Type    Reason   Age   From     Message
#    ----    ------   ----  ----     -------
#    Normal  Pulled   17m   kubelet  Container image "registry.k8s.io/kube-scheduler:v1.29.0" already present on machine
#    Normal  Created  17m   kubelet  Created container kube-scheduler
#    Normal  Started  17m   kubelet  Started container kube-scheduler
#  


kubectl get pod kube-scheduler-controlplane  -n kube-system -o yaml

netstat noalt | grep -i scheduler


netstat -nap | grep etcd


netstat -nap | grep scheduler
tcp        0      0 127.0.0.1:10259         0.0.0.0:*               LISTEN      3840/kube-scheduler
tcp        0      0 192.32.98.9:44618       192.32.98.9:6443        ESTABLISHED 3840/kube-scheduler
tcp        0      0 192.32.98.9:44582       192.32.98.9:6443        ESTABLISHED 3840/kube-scheduler 