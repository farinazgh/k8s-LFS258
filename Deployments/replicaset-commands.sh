ubuntu@ip-172-31-40-74:~$ kubectl get rs
No resources found in default namespace.
ubuntu@ip-172-31-40-74:~$ kubectl get replicaset nginx --image=nginx --dry-run=client -o yaml
error: unknown flag: --image
See 'kubectl get --help' for usage.
ubuntu@ip-172-31-40-74:~$ kubectl create replicaset nginx --image=nginx --dry-run=client -o yaml
error: unknown flag: --image
See 'kubectl create --help' for usage.
ubuntu@ip-172-31-40-74:~$ ls
calico.yaml  my-specs
ubuntu@ip-172-31-40-74:~$ cd my-specs/
ubuntu@ip-172-31-40-74:~/my-specs$ vi simple-rs.yaml
ubuntu@ip-172-31-40-74:~/my-specs$ kubectl apply -f simple-rs.yaml
replicaset.apps/nginx created
ubuntu@ip-172-31-40-74:~/my-specs$ kubectl get all
NAME              READY   STATUS    RESTARTS   AGE
pod/nginx-4q2wr   1/1     Running   0          21s

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   26h

NAME                    DESIRED   CURRENT   READY   AGE
replicaset.apps/nginx   1         1         1       21s
ubuntu@ip-172-31-40-74:~/my-specs$ kubectl describe replicaset nginx
Name:         nginx
Namespace:    default
Selector:     app=nginx
Labels:       <none>
Annotations:  <none>
Replicas:     1 current / 1 desired
Pods Status:  1 Running / 0 Waiting / 0 Succeeded / 0 Failed
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
Events:
  Type    Reason            Age   From                   Message
  ----    ------            ----  ----                   -------
  Normal  SuccessfulCreate  35s   replicaset-controller  Created pod: nginx-4q2wr
ubuntu@ip-172-31-40-74:~/my-specs$ kubectl get pods
NAME          READY   STATUS    RESTARTS   AGE
nginx-4q2wr   1/1     Running   0          71s
ubuntu@ip-172-31-40-74:~/my-specs$ kubectl delete replicaset nginx --cascade=orphan
replicaset.apps "nginx" deleted
ubuntu@ip-172-31-40-74:~/my-specs$ kubectl get pods
NAME          READY   STATUS    RESTARTS   AGE
nginx-4q2wr   1/1     Running   0          98s
ubuntu@ip-172-31-40-74:~/my-specs$ kubectl describe pod nginx-4q2wr
Name:             nginx-4q2wr
Namespace:        default
Priority:         0
Service Account:  default
Node:             ip-172-31-40-74/172.31.40.74
Start Time:       Tue, 19 Mar 2024 17:52:47 +0000
Labels:           app=nginx
Annotations:      cni.projectcalico.org/containerID: 26b69533182b65f7357d301258e3a76ac9ce1842673632326db1afe90dc1fb4c
                  cni.projectcalico.org/podIP: 192.168.10.20/32
                  cni.projectcalico.org/podIPs: 192.168.10.20/32
Status:           Running
IP:               192.168.10.20
IPs:
  IP:  192.168.10.20
Containers:
  nginx:
    Container ID:   containerd://611f2dfd116279c8b2ce7c08387e02a2545bb857904c5c36fbb9366a2a008cc1
    Image:          nginx
    Image ID:       docker.io/library/nginx@sha256:6db391d1c0cfb30588ba0bf72ea999404f2764febf0f1f196acd5867ac7efa7e
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Tue, 19 Mar 2024 17:52:49 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-9vclv (ro)
Conditions:
  Type              Status
  Initialized       True
  Ready             True
  ContainersReady   True
  PodScheduled      True
Volumes:
  kube-api-access-9vclv:
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
  Normal  Scheduled  2m5s  default-scheduler  Successfully assigned default/nginx-4q2wr to ip-172-31-40-74
  Normal  Pulling    2m5s  kubelet            Pulling image "nginx"
  Normal  Pulled     2m4s  kubelet            Successfully pulled image "nginx" in 580ms (580ms including waiting)
  Normal  Created    2m4s  kubelet            Created container nginx
  Normal  Started    2m4s  kubelet            Started container nginx
ubuntu@ip-172-31-40-74:~/my-specs$ kubectl get pods -L system
NAME          READY   STATUS    RESTARTS   AGE     SYSTEM
nginx-4q2wr   1/1     Running   0          4m31s
ubuntu@ip-172-31-40-74:~/my-specs$
