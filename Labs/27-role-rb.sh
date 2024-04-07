kubectl get serviceaccounts --all-namespaces | wc
#  kubectl get serviceaccount default -o yaml
#  apiVersion: v1
#  kind: ServiceAccount
#  metadata:
#    name: default
#    namespace: default

kubectl describe serviceaccount default
#  Name:                default
#  Namespace:           default
#  Labels:              <none>
#  Annotations:         <none>
#  Image pull secrets:  <none>
#  Mountable secrets:   <none>
#  Tokens:              <none>
#  Events:              <none>

kubectl get deployments
#  NAME            READY   UP-TO-DATE   AVAILABLE   AGE
#  web-dashboard   1/1     1            1           18s

kubectl get deployments -o wide
#  NAME            READY   UP-TO-DATE   AVAILABLE   AGE   CONTAINERS      IMAGES                                                 SELECTOR
#  web-dashboard   1/1     1            1           23s   web-dashboard   gcr.io/kodekloud/customimage/my-kubernetes-dashboard   name=web-dashboard

kubectl get pods
#  NAME                             READY   STATUS    RESTARTS   AGE
#  web-dashboard-74cbcd9494-wjxcd   1/1     Running   0          112s

kubectl describe deployment web-dashboard
#  Name:                   web-dashboard
#  Namespace:              default
#  Labels:                 <none>
#  Annotations:            deployment.kubernetes.io/revision: 1
#  Selector:               name=web-dashboard
#  Replicas:               1 desired | 1 updated | 1 total | 1 available | 0 unavailable
#  StrategyType:           RollingUpdate
#  MinReadySeconds:        0
#  RollingUpdateStrategy:  25% max unavailable, 25% max surge
#  Pod Template:
#    Labels:  name=web-dashboard
#    Containers:
#     web-dashboard:
#      Image:      gcr.io/kodekloud/customimage/my-kubernetes-dashboard
#      Port:       8080/TCP
#      Host Port:  0/TCP
#      Environment:
#        PYTHONUNBUFFERED:  1
#      Mounts:              <none>
#    Volumes:               <none>
#  Conditions:
#    Type           Status  Reason
#    ----           ------  ------
#    Available      True    MinimumReplicasAvailable
#    Progressing    True    NewReplicaSetAvailable
#  OldReplicaSets:  <none>
#  NewReplicaSet:   web-dashboard-74cbcd9494 (1/1 replicas created)
#  Events:
#    Type    Reason             Age    From                   Message
#    ----    ------             ----   ----                   -------
#    Normal  ScalingReplicaSet  2m22s  deployment-controller  Scaled up replica set web-dashboard-74cbcd9494 to 1


kubectl get pods
#  NAME                             READY   STATUS    RESTARTS   AGE
#  web-dashboard-74cbcd9494-wjxcd   1/1     Running   0          3m6s

kubectl describe pod web-dashboard-74cbcd9494-wjxcd
#  Name:             web-dashboard-74cbcd9494-wjxcd
#  Namespace:        default
#  Priority:         0
#  Service Account:  default
#  Node:             controlplane/192.13.128.9
#  Start Time:       Sun, 07 Apr 2024 09:50:49 +0000
#  Labels:           name=web-dashboard
#                    pod-template-hash=74cbcd9494
#  Annotations:      <none>
#  Status:           Running
#  IP:               10.42.0.9
#  IPs:
#    IP:           10.42.0.9
#  Controlled By:  ReplicaSet/web-dashboard-74cbcd9494
#  Containers:
#    web-dashboard:
#      Container ID:   containerd://0b87cb91d13ad1440de1586ecf314f5e35e4bdb475293251ac384201aa3880c8
#      Image:          gcr.io/kodekloud/customimage/my-kubernetes-dashboard
#      Image ID:       gcr.io/kodekloud/customimage/my-kubernetes-dashboard@sha256:7d70abe342b13ff1c4242dc83271ad73e4eedb04e2be0dd30ae7ac8852193069
#      Port:           8080/TCP
#      Host Port:      0/TCP
#      State:          Running
#        Started:      Sun, 07 Apr 2024 09:50:53 +0000
#      Ready:          True
#      Restart Count:  0
#      Environment:
#        PYTHONUNBUFFERED:  1
#      Mounts:
#        /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-glgk8 (ro)
#  Conditions:
#    Type                        Status
#    PodReadyToStartContainers   True
#    Initialized                 True
#    Ready                       True
#    ContainersReady             True
#    PodScheduled                True
#  Volumes:
#    kube-api-access-glgk8:
#      Type:                    Projected (a volume that contains injected data from multiple sources)
#      TokenExpirationSeconds:  3607
#      ConfigMapName:           kube-root-ca.crt
#      ConfigMapOptional:       <nil>
#      DownwardAPI:             true
#  QoS Class:                   BestEffort
#  Node-Selectors:              <none>
#  Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
#                               node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
#  Events:
#    Type    Reason     Age    From               Message
#    ----    ------     ----   ----               -------
#    Normal  Scheduled  3m18s  default-scheduler  Successfully assigned default/web-dashboard-74cbcd9494-wjxcd to controlplane
#    Normal  Pulling    3m17s  kubelet            Pulling image "gcr.io/kodekloud/customimage/my-kubernetes-dashboard"
#    Normal  Pulled     3m14s  kubelet            Successfully pulled image "gcr.io/kodekloud/customimage/my-kubernetes-dashboard" in 2.871s (2.871s including waiting)
#    Normal  Created    3m14s  kubelet            Created container web-dashboard
#    Normal  Started    3m14s  kubelet            Started container web-dashboard

kubectl get serviceaccount default -o yaml
#  apiVersion: v1
#  kind: ServiceAccount
#  metadata:
#    creationTimestamp: "2024-04-07T09:39:33Z"
#    name: default
#    namespace: default
#    resourceVersion: "403"
#    uid: 88e44a65-860c-4874-a3c9-0ce940144e2a

kubectl create serviceaccount dashboard-sa
#  serviceaccount/dashboard-sa created

kubectl get serviceaccount dashboard-sa -o yaml
#  apiVersion: v1
#  kind: ServiceAccount
#  metadata:
#    name: dashboard-sa
#    namespace: default

ls /var/rbac
#  dashboard-sa-role-binding.yaml  pod-reader-role.yaml

cd  /var/rbac

cat dashboard-sa-role-binding.yaml
#  ---
#  kind: RoleBinding
#  apiVersion: rbac.authorization.k8s.io/v1
#  metadata:
#    name: read-pods
#    namespace: default
#  subjects:
#  - kind: ServiceAccount
#    name: dashboard-sa #   Name is case sensitive
#    namespace: default
#  roleRef:
#    kind: Role #  this must be Role or ClusterRole
#    name: pod-reader #   this must match the name of the Role or ClusterRole you wish to bind to
#    apiGroup: rbac.authorization.k8s.io

cat pod-reader-role.yaml
#  ---
#  kind: Role
#  apiVersion: rbac.authorization.k8s.io/v1
#  metadata:
#    namespace: default
#    name: pod-reader
#  rules:
#  - apiGroups:
#    - ''
#    resources:
#    - pods
#    verbs:
#    - get
#    - watch
#    - list


kubectl get serviceaccounts
kubectl get serviceaccounts --all-namespaces
kubectl get serviceaccounts --all-namespaces | wc

kubectl get serviceaccount default -o yaml
kubectl describe serviceaccount default
kubectl get deployments
kubectl get deployments -o wide
kubectl get pods
kubectl describe deployment web-dashboard
kubectl get pods
kubectl describe pod web-dashboard-74cbcd9494-wjxcd
kubectl get serviceaccount default -o yaml
kubectl create serviceaccount dashboard-sa
kubectl get serviceaccount dashboard-sa -o yaml
ls /var/rbac
 cd  /var/rbac
cat dashboard-sa-role-binding.yaml
cat pod-reader-role.yaml
