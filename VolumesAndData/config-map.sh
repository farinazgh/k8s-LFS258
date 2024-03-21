ubuntu@ip-172-31-40-74:~$ ls
calico.yaml  my-specs
ubuntu@ip-172-31-40-74:~$ mkdir primary
ubuntu@ip-172-31-40-74:~$ echo c > primary/cyan
echo m > primary/magenta
echo y > primary/yellow
echo k > primary/black
echo "known as key" >> primary/black
echo blue > favorite
ubuntu@ip-172-31-40-74:~$ kubectl create configmap colors \
--from-literal=text=black \
--from-file=./favorite \
--from-file=./primary/
configmap/colors created
ubuntu@ip-172-31-40-74:~$ kubectl get configmap color -o yaml
Error from server (NotFound): configmaps "color" not found
ubuntu@ip-172-31-40-74:~$ kubectl get configmap colors -o yaml
apiVersion: v1
data:
  black: |
    k
    known as key
  cyan: |
    c
  favorite: |
    blue
  magenta: |
    m
  text: black
  yellow: |
    y
kind: ConfigMap
metadata:
  creationTimestamp: "2024-03-21T05:52:14Z"
  name: colors
  namespace: default
  resourceVersion: "32587"
  uid: c3b418e3-2575-4987-8fc8-f1ba07730546
ubuntu@ip-172-31-40-74:~$ kubectl get configmap color -o wide
Error from server (NotFound): configmaps "color" not found
ubuntu@ip-172-31-40-74:~$ kubectl get configmap colors -o wide
NAME     DATA   AGE
colors   6      3m33s
ubuntu@ip-172-31-40-74:~$ pwd
/home/ubuntu
ubuntu@ip-172-31-40-74:~$ ls
calico.yaml  favorite  my-specs  primary
ubuntu@ip-172-31-40-74:~$ vim shell-demo-pod.yaml
ubuntu@ip-172-31-40-74:~$ kubectl apply -f shell-demo-pod.yaml
pod/shell-demo created
ubuntu@ip-172-31-40-74:~$ kubectl get all
NAME             READY   STATUS    RESTARTS   AGE
pod/shell-demo   1/1     Running   0          38s

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   2d14h
ubuntu@ip-172-31-40-74:~$ kubectl get pod shell-demo -o wide
NAME         READY   STATUS    RESTARTS   AGE   IP              NODE              NOMINATED NODE   READINESS GATES
shell-demo   1/1     Running   0          49s   192.168.10.31   ip-172-31-40-74   <none>           <none>
ubuntu@ip-172-31-40-74:~$ kubectl describe pod shell-demo
Name:             shell-demo
Namespace:        default
Priority:         0
Service Account:  default
Node:             ip-172-31-40-74/172.31.40.74
Start Time:       Thu, 21 Mar 2024 05:58:57 +0000
Labels:           <none>
Annotations:      cni.projectcalico.org/containerID: fe60ef98a8a5878573b935333a55e18fecbf9578bc7f19eb0fafbefea16096d9
                  cni.projectcalico.org/podIP: 192.168.10.31/32
                  cni.projectcalico.org/podIPs: 192.168.10.31/32
Status:           Running
IP:               192.168.10.31
IPs:
  IP:  192.168.10.31
Containers:
  nginx:
    Container ID:   containerd://a8e80f52cc9c3bd253a16b67b10bad7efd5b4451041f81f613c06def07a9ac12
    Image:          nginx
    Image ID:       docker.io/library/nginx@sha256:6db391d1c0cfb30588ba0bf72ea999404f2764febf0f1f196acd5867ac7efa7e
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Thu, 21 Mar 2024 05:58:58 +0000
    Ready:          True
    Restart Count:  0
    Environment:
      iLike:  <set to the key 'favorite' of config map 'colors'>  Optional: false
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-cqxw8 (ro)
Conditions:
  Type              Status
  Initialized       True
  Ready             True
  ContainersReady   True
  PodScheduled      True
Volumes:
  kube-api-access-cqxw8:
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
  Normal  Scheduled  66s   default-scheduler  Successfully assigned default/shell-demo to ip-172-31-40-74
  Normal  Pulling    65s   kubelet            Pulling image "nginx"
  Normal  Pulled     65s   kubelet            Successfully pulled image "nginx" in 609ms (609ms including waiting)
  Normal  Created    65s   kubelet            Created container nginx
  Normal  Started    65s   kubelet            Started container nginx
ubuntu@ip-172-31-40-74:~$ kubectl exe shell-demo -- /bin/bash
error: unknown command "exe" for "kubectl"

Did you mean this?
        exec
ubuntu@ip-172-31-40-74:~$ kubectl exec shell-demo -- /bin/bash
ubuntu@ip-172-31-40-74:~$ kubectl exec shell-demo -- /bin/bash -c 'echo $iLike'
blue
ubuntu@ip-172-31-40-74:~$ kubectl exec -it shell-demo
error: you must specify at least one command for the container
ubuntu@ip-172-31-40-74:~$ kubectl exec -it shell-demo --/bin/bash
error: unknown flag: --/bin/bash
See 'kubectl exec --help' for usage.
ubuntu@ip-172-31-40-74:~$ kubectl exec -it shell-demo -- /bin/bash
root@shell-demo:/# printenv
KUBERNETES_SERVICE_PORT_HTTPS=443
KUBERNETES_SERVICE_PORT=443
HOSTNAME=shell-demo
iLike=blue

PWD=/
PKG_RELEASE=1~bookworm
HOME=/root
KUBERNETES_PORT_443_TCP=tcp://10.96.0.1:443
NJS_VERSION=0.8.3
TERM=xterm
SHLVL=1
KUBERNETES_PORT_443_TCP_PROTO=tcp
KUBERNETES_PORT_443_TCP_ADDR=10.96.0.1
KUBERNETES_SERVICE_HOST=10.96.0.1
KUBERNETES_PORT=tcp://10.96.0.1:443
KUBERNETES_PORT_443_TCP_PORT=443
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
NGINX_VERSION=1.25.4
_=/usr/bin/printenv
root@shell-demo:/# exit
exit
ubuntu@ip-172-31-40-74:~$ kubectl delete pod nginx
Error from server (NotFound): pods "nginx" not found
ubuntu@ip-172-31-40-74:~$ kubectl delete pod shell-demo
pod "shell-demo" deleted
ubuntu@ip-172-31-40-74:~$ vi my-specs/
ca.pem              client-key.pem      client.pem          curl-pod.json       my-deployment.yaml  simple-rs.yaml
ubuntu@ip-172-31-40-74:~$ ls
calico.yaml  favorite  my-specs  primary  shell-demo-pod.yaml
ubuntu@ip-172-31-40-74:~$ vi shell-demo-pod.yaml
ubuntu@ip-172-31-40-74:~$ vi shell-demo-2.yaml
ubuntu@ip-172-31-40-74:~$ kubectl apply -f shell-demo-2.yaml
pod/shell-demo created
ubuntu@ip-172-31-40-74:~$ kubectl get pods
NAME         READY   STATUS    RESTARTS   AGE
shell-demo   1/1     Running   0          6s
ubuntu@ip-172-31-40-74:~$ kubectl exec -it shell-demo -- /bin/bash/
error: Internal error occurred: error executing command in container: failed to exec in container: failed to start exec "40db354fa851961d65ea71b086a21e31da0dcd1da51d4fe886306fabf2a9c880": OCI runtime exec failed: exec failed: unable to start container process: exec: "/bin/bash/": stat /bin/bash/: not a directory: unknown
ubuntu@ip-172-31-40-74:~$ kubectl exec -it shell-demo -- /bin/bash
root@shell-demo:/# printenv
black=k
known as key

KUBERNETES_SERVICE_PORT_HTTPS=443
cyan=c

yellow=y

KUBERNETES_SERVICE_PORT=443
HOSTNAME=shell-demo
PWD=/
PKG_RELEASE=1~bookworm
HOME=/root
KUBERNETES_PORT_443_TCP=tcp://10.96.0.1:443
text=black
NJS_VERSION=0.8.3
TERM=xterm
favorite=blue

SHLVL=1
KUBERNETES_PORT_443_TCP_PROTO=tcp
KUBERNETES_PORT_443_TCP_ADDR=10.96.0.1
KUBERNETES_SERVICE_HOST=10.96.0.1
KUBERNETES_PORT=tcp://10.96.0.1:443
KUBERNETES_PORT_443_TCP_PORT=443
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
NGINX_VERSION=1.25.4
magenta=m

_=/usr/bin/printenv
root@shell-demo:/# kubectl delete pod shell-demo
bash: kubectl: command not found
root@shell-demo:/# exit
exit
command terminated with exit code 127
ubuntu@ip-172-31-40-74:~$ kubectl delete pod shell-demo
pod "shell-demo" deleted
ubuntu@ip-172-31-40-74:~$
