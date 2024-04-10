What binary executable file will be run by kubelet after a container and its associated namespace are created?


    1  history
    2  ps aux | grep kubelet
    3  cd /opt/cni/bin/
    4  ls -alrt
    5  kubectl get pods -n kube-system
    6  kubectl get pods --all-namespaces
    7  history
    1  kubectl het nodes -o wide
    2  kubectl get nodes -o wide
    3  kubectl get pods --all-namespaces
    4  cd /etc/cni/net.d/
    5  ls
    6  kubectl get pods --all-namespaces -o wide
    7  ip link show
    8  ip a
    9  ssh node01
   10  history










controlplane ~ ➜  kubectl get nodes -o wide
NAME           STATUS   ROLES           AGE   VERSION   INTERNAL-IP    EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION   CONTAINER-RUNTIME
controlplane   Ready    control-plane   40m   v1.29.0   192.21.28.12   <none>        Ubuntu 22.04.3 LTS   5.4.0-1106-gcp   containerd://1.6.26
node01         Ready    <none>          39m   v1.29.0   192.21.28.3    <none>        Ubuntu 22.04.3 LTS   5.4.0-1106-gcp   containerd://1.6.26

controlplane ~ ➜  kubectl get pods --all-namespaces
NAMESPACE     NAME                                   READY   STATUS    RESTARTS      AGE
kube-system   coredns-69f9c977-gcr97                 1/1     Running   0             46m
kube-system   coredns-69f9c977-tj9g7                 1/1     Running   0             46m
kube-system   etcd-controlplane                      1/1     Running   0             46m
kube-system   kube-apiserver-controlplane            1/1     Running   0             46m
kube-system   kube-controller-manager-controlplane   1/1     Running   0             46m
kube-system   kube-proxy-f9m5r                       1/1     Running   0             46m
kube-system   kube-proxy-q4ckb                       1/1     Running   0             45m
kube-system   kube-scheduler-controlplane            1/1     Running   0             46m
kube-system   weave-net-2mvgr                        2/2     Running   1 (46m ago)   46m
kube-system   weave-net-xms58                        2/2     Running   0             45m

controlplane ~ ➜  kubectl get pods --all-namespaces -o wide
NAMESPACE     NAME                                   READY   STATUS    RESTARTS      AGE   IP             NODE           NOMINATED NODE   READINESS GATES
kube-system   coredns-69f9c977-gcr97                 1/1     Running   0             46m   10.244.0.3     controlplane   <none>           <none>
kube-system   coredns-69f9c977-tj9g7                 1/1     Running   0             46m   10.244.0.2     controlplane   <none>           <none>
kube-system   etcd-controlplane                      1/1     Running   0             46m   192.21.28.12   controlplane   <none>           <none>
kube-system   kube-apiserver-controlplane            1/1     Running   0             46m   192.21.28.12   controlplane   <none>           <none>
kube-system   kube-controller-manager-controlplane   1/1     Running   0             46m   192.21.28.12   controlplane   <none>           <none>
kube-system   kube-proxy-f9m5r                       1/1     Running   0             46m   192.21.28.12   controlplane   <none>           <none>
kube-system   kube-proxy-q4ckb                       1/1     Running   0             46m   192.21.28.3    node01         <none>           <none>
kube-system   kube-scheduler-controlplane            1/1     Running   0             46m   192.21.28.12   controlplane   <none>           <none>
kube-system   weave-net-2mvgr                        2/2     Running   1 (46m ago)   46m   192.21.28.12   controlplane   <none>           <none>
kube-system   weave-net-xms58                        2/2     Running   0             46m   192.21.28.3    node01         <none>           <none>

controlplane ~ ➜  kubectl get services --all-namespaces -o wide
NAMESPACE     NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)                  AGE   SELECTOR
default       kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP                  47m   <none>
kube-system   kube-dns     ClusterIP   10.96.0.10   <none>        53/UDP,53/TCP,9153/TCP   47m   k8s-app=kube-dns

controlplane ~ ➜  kubectl get ep --all-namespaces\
> ^C

controlplane ~ ✖ kubectl get ep --all-namespaces
NAMESPACE     NAME         ENDPOINTS                                               AGE
default       kubernetes   192.21.28.12:6443                                       47m
kube-system   kube-dns     10.244.0.2:53,10.244.0.3:53,10.244.0.2:53 + 3 more...   47m

controlplane ~ ➜  kubectl get pods --all-namespaces | grep -i daemonset

controlplane ~ ✖ kubectl get pods --all-namespaces | grep -i daemon

controlplane ~ ✖ kubectl get pods --all-namespaces
NAMESPACE     NAME                                   READY   STATUS    RESTARTS      AGE
kube-system   coredns-69f9c977-gcr97                 1/1     Running   0             48m
kube-system   coredns-69f9c977-tj9g7                 1/1     Running   0             48m
kube-system   etcd-controlplane                      1/1     Running   0             48m
kube-system   kube-apiserver-controlplane            1/1     Running   0             48m
kube-system   kube-controller-manager-controlplane   1/1     Running   0             48m
kube-system   kube-proxy-f9m5r                       1/1     Running   0             48m
kube-system   kube-proxy-q4ckb                       1/1     Running   0             48m
kube-system   kube-scheduler-controlplane            1/1     Running   0             48m
kube-system   weave-net-2mvgr                        2/2     Running   1 (48m ago)   48m
kube-system   weave-net-xms58                        2/2     Running   0             48m

controlplane ~ ➜  kubectl get all -n kube-system
NAME                                       READY   STATUS    RESTARTS      AGE
pod/coredns-69f9c977-gcr97                 1/1     Running   0             49m
pod/coredns-69f9c977-tj9g7                 1/1     Running   0             49m
pod/etcd-controlplane                      1/1     Running   0             49m
pod/kube-apiserver-controlplane            1/1     Running   0             49m
pod/kube-controller-manager-controlplane   1/1     Running   0             49m
pod/kube-proxy-f9m5r                       1/1     Running   0             49m
pod/kube-proxy-q4ckb                       1/1     Running   0             48m
pod/kube-scheduler-controlplane            1/1     Running   0             49m
pod/weave-net-2mvgr                        2/2     Running   1 (49m ago)   49m
pod/weave-net-xms58                        2/2     Running   0             48m

NAME               TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)                  AGE
service/kube-dns   ClusterIP   10.96.0.10   <none>        53/UDP,53/TCP,9153/TCP   49m

NAME                        DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
daemonset.apps/kube-proxy   2         2         2       2            2           kubernetes.io/os=linux   49m
daemonset.apps/weave-net    2         2         2       2            2           <none>                   49m

NAME                      READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/coredns   2/2     2            2           49m

NAME                               DESIRED   CURRENT   READY   AGE
replicaset.apps/coredns-69f9c977   2         2         2       49m

controlplane ~ ➜  kubectl describe deployment kube-proxy
Error from server (NotFound): deployments.apps "kube-proxy" not found

controlplane ~ ✖ kubectl describe deployment kube-proxy -n kube-proxy
Error from server (NotFound): namespaces "kube-proxy" not found

controlplane ~ ✖ kubectl describe deployment kube-proxy -n kube-system
Error from server (NotFound): deployments.apps "kube-proxy" not found

controlplane ~ ✖ kubectl describe ds kube-proxy -n kube-system
Name:           kube-proxy
Selector:       k8s-app=kube-proxy
Node-Selector:  kubernetes.io/os=linux
Labels:         k8s-app=kube-proxy
Annotations:    deprecated.daemonset.template.generation: 1
Desired Number of Nodes Scheduled: 2
Current Number of Nodes Scheduled: 2
Number of Nodes Scheduled with Up-to-date Pods: 2
Number of Nodes Scheduled with Available Pods: 2
Number of Nodes Misscheduled: 0
Pods Status:  2 Running / 0 Waiting / 0 Succeeded / 0 Failed
Pod Template:
  Labels:           k8s-app=kube-proxy
  Service Account:  kube-proxy
  Containers:
   kube-proxy:
    Image:      registry.k8s.io/kube-proxy:v1.29.0
    Port:       <none>
    Host Port:  <none>
    Command:
      /usr/local/bin/kube-proxy
      --config=/var/lib/kube-proxy/config.conf
      --hostname-override=$(NODE_NAME)
    Environment:
      NODE_NAME:   (v1:spec.nodeName)
    Mounts:
      /lib/modules from lib-modules (ro)
      /run/xtables.lock from xtables-lock (rw)
      /var/lib/kube-proxy from kube-proxy (rw)
  Volumes:
   kube-proxy:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      kube-proxy
    Optional:  false
   xtables-lock:
    Type:          HostPath (bare host directory volume)
    Path:          /run/xtables.lock
    HostPathType:  FileOrCreate
   lib-modules:
    Type:               HostPath (bare host directory volume)
    Path:               /lib/modules
    HostPathType:
  Priority Class Name:  system-node-critical
Events:
  Type    Reason            Age   From                  Message
  ----    ------            ----  ----                  -------
  Normal  SuccessfulCreate  50m   daemonset-controller  Created pod: kube-proxy-f9m5r
  Normal  SuccessfulCreate  49m   daemonset-controller  Created pod: kube-proxy-q4ckb

controlplane ~ ➜  kubectl get all -n kube-system -o wide
NAME                                       READY   STATUS    RESTARTS      AGE   IP             NODE           NOMINATED NODE   READINESS GATES
pod/coredns-69f9c977-gcr97                 1/1     Running   0             51m   10.244.0.3     controlplane   <none>           <none>
pod/coredns-69f9c977-tj9g7                 1/1     Running   0             51m   10.244.0.2     controlplane   <none>           <none>
pod/etcd-controlplane                      1/1     Running   0             51m   192.21.28.12   controlplane   <none>           <none>
pod/kube-apiserver-controlplane            1/1     Running   0             51m   192.21.28.12   controlplane   <none>           <none>
pod/kube-controller-manager-controlplane   1/1     Running   0             51m   192.21.28.12   controlplane   <none>           <none>
pod/kube-proxy-f9m5r                       1/1     Running   0             51m   192.21.28.12   controlplane   <none>           <none>
pod/kube-proxy-q4ckb                       1/1     Running   0             51m   192.21.28.3    node01         <none>           <none>
pod/kube-scheduler-controlplane            1/1     Running   0             51m   192.21.28.12   controlplane   <none>           <none>
pod/weave-net-2mvgr                        2/2     Running   1 (51m ago)   51m   192.21.28.12   controlplane   <none>           <none>
pod/weave-net-xms58                        2/2     Running   0             51m   192.21.28.3    node01         <none>           <none>

NAME               TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)                  AGE   SELECTOR
service/kube-dns   ClusterIP   10.96.0.10   <none>        53/UDP,53/TCP,9153/TCP   51m   k8s-app=kube-dns

NAME                        DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE   CONTAINERS        IMAGES                                                                       SELECTOR
daemonset.apps/kube-proxy   2         2         2       2            2           kubernetes.io/os=linux   51m   kube-proxy        registry.k8s.io/kube-proxy:v1.29.0                                           k8s-app=kube-proxy
daemonset.apps/weave-net    2         2         2       2            2           <none>                   51m   weave,weave-npc   docker.io/weaveworks/weave-kube:2.8.1,docker.io/weaveworks/weave-npc:2.8.1   name=weave-net

NAME                      READY   UP-TO-DATE   AVAILABLE   AGE   CONTAINERS   IMAGES                                    SELECTOR
deployment.apps/coredns   2/2     2            2           51m   coredns      registry.k8s.io/coredns/coredns:v1.10.1   k8s-app=kube-dns

NAME                               DESIRED   CURRENT   READY   AGE   CONTAINERS   IMAGES                                    SELECTOR
replicaset.apps/coredns-69f9c977   2         2         2       51m   coredns      registry.k8s.io/coredns/coredns:v1.10.1   k8s-app=kube-dns,pod-template-hash=69f9c977

controlplane ~ ➜  kubectl logs kube-proxy-f9m5r -n kube-system
I0409 11:36:04.169801       1 server_others.go:72] "Using iptables proxy"
I0409 11:36:04.177578       1 server.go:1050] "Successfully retrieved node IP(s)" IPs=["192.21.28.12"]
I0409 11:36:04.254323       1 conntrack.go:58] "Setting nf_conntrack_max" nfConntrackMax=1179648
I0409 11:36:04.255904       1 conntrack.go:118] "Set sysctl" entry="net/netfilter/nf_conntrack_tcp_timeout_established" value=86400
I0409 11:36:04.275469       1 server.go:652] "kube-proxy running in dual-stack mode" primary ipFamily="IPv4"
I0409 11:36:04.275499       1 server_others.go:168] "Using iptables Proxier"
I0409 11:36:04.277755       1 server_others.go:512] "Detect-local-mode set to ClusterCIDR, but no cluster CIDR for family" ipFamily="IPv6"
I0409 11:36:04.277777       1 server_others.go:529] "Defaulting to no-op detect-local"
I0409 11:36:04.277799       1 proxier.go:246] "Setting route_localnet=1 to allow node-ports on localhost; to change this either disable iptables.localhostNodePorts (--iptables-localhost-nodeports) or set nodePortAddresses (--nodeport-addresses) to filter loopback addresses"
I0409 11:36:04.294547       1 server.go:865] "Version info" version="v1.29.0"
I0409 11:36:04.294575       1 server.go:867] "Golang settings" GOGC="" GOMAXPROCS="" GOTRACEBACK=""
I0409 11:36:04.295195       1 config.go:97] "Starting endpoint slice config controller"
I0409 11:36:04.295229       1 config.go:188] "Starting service config controller"
I0409 11:36:04.295258       1 shared_informer.go:311] Waiting for caches to sync for endpoint slice config
I0409 11:36:04.295267       1 shared_informer.go:311] Waiting for caches to sync for service config
I0409 11:36:04.295285       1 config.go:315] "Starting node config controller"
I0409 11:36:04.295382       1 shared_informer.go:311] Waiting for caches to sync for node config
I0409 11:36:04.396296       1 shared_informer.go:318] Caches are synced for endpoint slice config
I0409 11:36:04.396413       1 shared_informer.go:318] Caches are synced for service config
I0409 11:36:04.396415       1 shared_informer.go:318] Caches are synced for node config

controlplane ~ ➜