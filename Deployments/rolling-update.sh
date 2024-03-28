
kubectl get all

 NAME                           READY   STATUS    RESTARTS   AGE
 pod/frontend-685dfcc44-brxjb   1/1     Running   0          70s
 pod/frontend-685dfcc44-4pbsk   1/1     Running   0          70s
 pod/frontend-685dfcc44-rjfkv   1/1     Running   0          70s
 pod/frontend-685dfcc44-mtzxh   1/1     Running   0          70s
 
 NAME                     TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
 service/kubernetes       ClusterIP   10.43.0.1      <none>        443/TCP          8m32s
 service/webapp-service   NodePort    10.43.98.112   <none>        8080:30080/TCP   70s
 
 NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
 deployment.apps/frontend   4/4     4            4           70s
 
 NAME                                 DESIRED   CURRENT   READY   AGE
 replicaset.apps/frontend-685dfcc44   4         4         4       70s
 
curl-pod.yaml  curl-test.sh

cat curl-test.sh 
 for i in {1..35}; do
    kubectl exec --namespace=kube-public curl -- sh -c 'test=`wget -qO- -T 2  http://webapp-service.default.svc.cluster.local:8080/info 2>&1` && echo "$test OK" || echo "Failed"';
    echo ""
 done
 

kubectl get all

 NAME                           READY   STATUS    RESTARTS   AGE
 pod/frontend-685dfcc44-brxjb   1/1     Running   0          2m47s
 pod/frontend-685dfcc44-4pbsk   1/1     Running   0          2m47s
 pod/frontend-685dfcc44-rjfkv   1/1     Running   0          2m47s
 pod/frontend-685dfcc44-mtzxh   1/1     Running   0          2m47s
 
 NAME                     TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
 service/kubernetes       ClusterIP   10.43.0.1      <none>        443/TCP          10m
 service/webapp-service   NodePort    10.43.98.112   <none>        8080:30080/TCP   2m47s
 
 NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
 deployment.apps/frontend   4/4     4            4           2m47s
 
 NAME                                 DESIRED   CURRENT   READY   AGE
 replicaset.apps/frontend-685dfcc44   4         4         4       2m47s

kubectl describe pod frontend-685dfcc44-mtzxh 
 Name:             frontend-685dfcc44-mtzxh
 Namespace:        default
 Priority:         0
 Service Account:  default
 Node:             controlplane/192.19.214.9
 Start Time:       Wed, 27 Mar 2024 09:34:56 +0000
 Labels:           name=webapp
                   pod-template-hash=685dfcc44
 Annotations:      <none>
 Status:           Running
 IP:               10.42.0.12
 IPs:
   IP:           10.42.0.12
 Controlled By:  ReplicaSet/frontend-685dfcc44
 Containers:
   simple-webapp:
     Container ID:   containerd://cd7745c2a24f84e5a223a644b93c059f91fc2f4572bc2d43d9a02b9a53a507cf
     Image:          kodekloud/webapp-color:v1
     Image ID:       docker.io/kodekloud/webapp-color@sha256:27b1e0cbd55a646824c231c896bf77f8278f2d335c4f2b47cbb258edf8281ceb
     Port:           8080/TCP
     Host Port:      0/TCP
     State:          Running
       Started:      Wed, 27 Mar 2024 09:35:00 +0000
     Ready:          True
     Restart Count:  0
     Environment:    <none>
     Mounts:
       /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-d2lhs (ro)
 Conditions:
   Type                        Status
   PodReadyToStartContainers   True
   Initialized                 True
   Ready                       True
   ContainersReady             True
   PodScheduled                True
 Volumes:
   kube-api-access-d2lhs:
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
   Normal  Scheduled  3m14s  default-scheduler  Successfully assigned default/frontend-685dfcc44-mtzxh to controlplane
   Normal  Pulling    3m13s  kubelet            Pulling image "kodekloud/webapp-color:v1"
   Normal  Pulled     3m10s  kubelet            Successfully pulled image "kodekloud/webapp-color:v1" in 3.12s (3.12s including waiting)
   Normal  Created    3m10s  kubelet            Created container simple-webapp
   Normal  Started    3m10s  kubelet            Started container simple-webapp
 
kubectl describe deployment frontend
 Name:                   frontend
 Namespace:              default
 CreationTimestamp:      Wed, 27 Mar 2024 09:34:56 +0000
 Labels:                 <none>
 Annotations:            deployment.kubernetes.io/revision: 1
 Selector:               name=webapp
 Replicas:               4 desired | 4 updated | 4 total | 4 available | 0 unavailable
 StrategyType:           RollingUpdate
 MinReadySeconds:        20
 RollingUpdateStrategy:  25% max unavailable, 25% max surge
 Pod Template:
   Labels:  name=webapp
   Containers:
    simple-webapp:
     Image:        kodekloud/webapp-color:v1
     Port:         8080/TCP
     Host Port:    0/TCP
     Environment:  <none>
     Mounts:       <none>
   Volumes:        <none>
 Conditions:
   Type           Status  Reason
   ----           ------  ------
   Available      True    MinimumReplicasAvailable
   Progressing    True    NewReplicaSetAvailable
 OldReplicaSets:  <none>
 NewReplicaSet:   frontend-685dfcc44 (4/4 replicas created)
 Events:
   Type    Reason             Age   From                   Message
   ----    ------             ----  ----                   -------
   Normal  ScalingReplicaSet  4m    deployment-controller  Scaled up replica set frontend-685dfcc44 to 4
 
 kubectl describe deployment frontend | grep -i strategy
 StrategyType:           RollingUpdate
 RollingUpdateStrategy:  25% max unavailable, 25% max surge
 
kubectl edit deployment frontend
deployment.apps/frontend edited

kubectl get pods --watch
NAME                       READY   STATUS        RESTARTS   AGE
frontend-685dfcc44-brxjb   1/1     Running       0          5m54s
frontend-685dfcc44-brxjb   1/1     Terminating   0          6m2s
frontend-685dfcc44-brxjb   0/1     Terminating         0          6m33s
frontend-685dfcc44-brxjb   0/1     Terminating         0          6m33s
frontend-685dfcc44-brxjb   0/1     Terminating         0          6m33s
frontend-685dfcc44-brxjb   0/1     Terminating         0          6m33s
 termniated
frontend-685dfcc44-rjfkv   1/1     Running       0          5m54s
frontend-685dfcc44-rjfkv   1/1     Terminating         0          6m24s
frontend-685dfcc44-rjfkv   0/1     Terminating         0          6m54s
frontend-685dfcc44-rjfkv   0/1     Terminating         0          6m55s
frontend-685dfcc44-rjfkv   0/1     Terminating         0          6m55s
frontend-685dfcc44-rjfkv   0/1     Terminating         0          6m55s
 terminated
frontend-685dfcc44-mtzxh   1/1     Running       0          5m54s
frontend-685dfcc44-mtzxh   1/1     Terminating   0          6m2s
frontend-685dfcc44-mtzxh   0/1     Terminating         0          6m33s
frontend-685dfcc44-mtzxh   0/1     Terminating         0          6m33s
frontend-685dfcc44-mtzxh   0/1     Terminating         0          6m33s
frontend-685dfcc44-mtzxh   0/1     Terminating         0          6m33s
 terminated

frontend-685dfcc44-4pbsk   1/1     Terminating   0          5m54s
frontend-685dfcc44-4pbsk   0/1     Terminating         0          6m10s
frontend-685dfcc44-4pbsk   0/1     Terminating         0          6m11s
frontend-685dfcc44-4pbsk   0/1     Terminating         0          6m11s
frontend-685dfcc44-4pbsk   0/1     Terminating         0          6m11s
 terminated
 couldnt catch the pendidng and container creating for these two pods
frontend-dbb8f4b47-slwbs   1/1     Running       0          15s
frontend-dbb8f4b47-dt49f   1/1     Running       0          15s
  new pods with version 2 are being borned
frontend-dbb8f4b47-45wfr   0/1     Pending       0          0s
frontend-dbb8f4b47-45wfr   0/1     Pending       0          0s
frontend-dbb8f4b47-45wfr   0/1     ContainerCreating   0          0s
frontend-dbb8f4b47-45wfr   1/1     Running             0          2s

  new pods with version 2 are being borned

frontend-dbb8f4b47-c9sht   0/1     Pending       0          0s
frontend-dbb8f4b47-c9sht   0/1     Pending       0          0s
frontend-dbb8f4b47-c9sht   0/1     ContainerCreating   0          0s
frontend-dbb8f4b47-c9sht   1/1     Running             0          2s




kubectl describe deployment frontend | grep -i strategy
StrategyType:           RollingUpdate
RollingUpdateStrategy:  25% max unavailable, 25% max surge


kubectl edit deployment frontend
deployment.apps/frontend edited

kubectl get pods --watch
NAME                       READY   STATUS    RESTARTS   AGE
frontend-dbb8f4b47-slwbs   1/1     Running   0          9m31s
frontend-dbb8f4b47-dt49f   1/1     Running   0          9m31s
frontend-dbb8f4b47-c9sht   1/1     Running   0          9m8s
frontend-dbb8f4b47-45wfr   1/1     Running   0          9m8s
^C
kubectl edit deployment frontend
deployment.apps/frontend edited

kubectl get all
NAME                           READY   STATUS        RESTARTS   AGE
pod/frontend-dbb8f4b47-dt49f   1/1     Terminating   0          10m
pod/frontend-dbb8f4b47-c9sht   1/1     Terminating   0          10m
pod/frontend-dbb8f4b47-45wfr   1/1     Terminating   0          10m
pod/frontend-dbb8f4b47-slwbs   1/1     Terminating   0          10m

NAME                     TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/kubernetes       ClusterIP   10.43.0.1      <none>        443/TCP          23m
service/webapp-service   NodePort    10.43.98.112   <none>        8080:30080/TCP   16m

NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/frontend   0/4     0            0           16m

NAME                                 DESIRED   CURRENT   READY   AGE
replicaset.apps/frontend-685dfcc44   0         0         0       16m
replicaset.apps/frontend-dbb8f4b47   0         0         0       10m

kubectl get pods --watch
NAME                       READY   STATUS        RESTARTS   AGE
frontend-dbb8f4b47-dt49f   1/1     Terminating   0          10m
frontend-dbb8f4b47-c9sht   1/1     Terminating   0          10m
frontend-dbb8f4b47-45wfr   1/1     Terminating   0          10m
frontend-dbb8f4b47-slwbs   1/1     Terminating   0          10m
frontend-dbb8f4b47-dt49f   0/1     Terminating   0          10m
frontend-dbb8f4b47-45wfr   0/1     Terminating   0          10m
frontend-dbb8f4b47-slwbs   0/1     Terminating   0          10m
frontend-dbb8f4b47-c9sht   0/1     Terminating   0          10m
frontend-dbb8f4b47-45wfr   0/1     Terminating   0          10m
frontend-dbb8f4b47-slwbs   0/1     Terminating   0          10m
frontend-7d9ccf9966-9l8wb   0/1     Pending       0          0s
frontend-dbb8f4b47-dt49f    0/1     Terminating   0          10m
frontend-7d9ccf9966-dqxlc   0/1     Pending       0          0s
frontend-7d9ccf9966-9l8wb   0/1     Pending       0          0s
frontend-7d9ccf9966-6kzvh   0/1     Pending       0          0s
frontend-7d9ccf9966-dqxlc   0/1     Pending       0          0s
frontend-7d9ccf9966-6kzvh   0/1     Pending       0          0s
frontend-dbb8f4b47-c9sht    0/1     Terminating   0          10m
frontend-7d9ccf9966-vvxxj   0/1     Pending       0          0s
frontend-7d9ccf9966-vvxxj   0/1     Pending       0          0s
frontend-7d9ccf9966-9l8wb   0/1     ContainerCreating   0          0s
frontend-7d9ccf9966-dqxlc   0/1     ContainerCreating   0          0s
frontend-7d9ccf9966-6kzvh   0/1     ContainerCreating   0          0s
frontend-7d9ccf9966-vvxxj   0/1     ContainerCreating   0          0s
frontend-dbb8f4b47-45wfr    0/1     Terminating         0          10m
frontend-dbb8f4b47-45wfr    0/1     Terminating         0          10m
frontend-dbb8f4b47-slwbs    0/1     Terminating         0          10m
frontend-dbb8f4b47-slwbs    0/1     Terminating         0          11m
frontend-dbb8f4b47-dt49f    0/1     Terminating         0          11m
frontend-dbb8f4b47-dt49f    0/1     Terminating         0          11m
frontend-dbb8f4b47-c9sht    0/1     Terminating         0          10m
frontend-dbb8f4b47-c9sht    0/1     Terminating         0          10m
frontend-7d9ccf9966-6kzvh   1/1     Running             0          4s
frontend-7d9ccf9966-vvxxj   1/1     Running             0          4s
frontend-7d9ccf9966-9l8wb   1/1     Running             0          4s
frontend-7d9ccf9966-dqxlc   1/1     Running             0          4s
----
 kubectl rollout history deployment frontend
deployment.apps/frontend
REVISION  CHANGE-CAUSE
1         <none>
2         <none>
3         <none>


kubectl rollout undo deployment/frontend --to-revision=1
deployment.apps/frontend rolled back

kubectl get pods --watch
NAME                        READY   STATUS        RESTARTS   AGE
frontend-7d9ccf9966-dqxlc   1/1     Terminating   0          3m6s
frontend-7d9ccf9966-6kzvh   1/1     Terminating   0          3m6s
frontend-7d9ccf9966-vvxxj   1/1     Terminating   0          3m6s
frontend-7d9ccf9966-9l8wb   1/1     Terminating   0          3m6s
frontend-7d9ccf9966-9l8wb   0/1     Terminating   0          3m29s
frontend-7d9ccf9966-6kzvh   0/1     Terminating   0          3m29s
frontend-7d9ccf9966-vvxxj   0/1     Terminating   0          3m29s
frontend-7d9ccf9966-dqxlc   0/1     Terminating   0          3m29s
frontend-7d9ccf9966-vvxxj   0/1     Terminating   0          3m29s
frontend-7d9ccf9966-vvxxj   0/1     Terminating   0          3m30s
frontend-7d9ccf9966-vvxxj   0/1     Terminating   0          3m30s
frontend-7d9ccf9966-6kzvh   0/1     Terminating   0          3m30s
frontend-7d9ccf9966-6kzvh   0/1     Terminating   0          3m30s
frontend-7d9ccf9966-6kzvh   0/1     Terminating   0          3m30s
frontend-7d9ccf9966-9l8wb   0/1     Terminating   0          3m30s
frontend-7d9ccf9966-9l8wb   0/1     Terminating   0          3m30s
frontend-7d9ccf9966-9l8wb   0/1     Terminating   0          3m30s
frontend-7d9ccf9966-dqxlc   0/1     Terminating   0          3m30s
frontend-7d9ccf9966-dqxlc   0/1     Terminating   0          3m30s
frontend-7d9ccf9966-dqxlc   0/1     Terminating   0          3m30s
frontend-685dfcc44-d4j7b    0/1     Pending       0          0s
frontend-685dfcc44-d4j7b    0/1     Pending       0          1s
frontend-685dfcc44-r7gsl    0/1     Pending       0          1s
frontend-685dfcc44-t2rch    0/1     Pending       0          1s
frontend-685dfcc44-r7gsl    0/1     Pending       0          1s
frontend-685dfcc44-t2rch    0/1     Pending       0          1s
frontend-685dfcc44-d4j7b    0/1     ContainerCreating   0          1s
frontend-685dfcc44-mwp9r    0/1     Pending             0          0s
frontend-685dfcc44-mwp9r    0/1     Pending             0          0s
frontend-685dfcc44-r7gsl    0/1     ContainerCreating   0          1s
frontend-685dfcc44-t2rch    0/1     ContainerCreating   0          1s
frontend-685dfcc44-mwp9r    0/1     ContainerCreating   0          0s
frontend-685dfcc44-r7gsl    1/1     Running             0          6s
frontend-685dfcc44-d4j7b    1/1     Running             0          6s
frontend-685dfcc44-mwp9r    1/1     Running             0          5s
frontend-685dfcc44-t2rch    1/1     Running             0          6s

kubectl rollout history deployment frontend
deployment.apps/frontend
REVISION  CHANGE-CAUSE
2         <none>
3         <none>
4         <none>
