####### create service account
#############################
kubectl create serviceaccount pvviewer
####### create cluster role
#############################
kubectl create clusterrole -h
kubectl create clusterrole pvviewer-role --verb=list --resource=persistentvolumes
####### create cluster role binding
#############################
kubectl create clusterrolebinding -h
kubectl create clusterrolebinding -h | grep -i serviceaccount
kubectl create clusterrolebinding pvviewer-role-binding  --clusterrole=pvviewer-role  --serviceaccount=default:pvviewer
kubectl run pvviewer  --image=redis --dry-run=client -o yaml > pvviewer.yaml
vi pvviewer.yaml
kubectl apply -f pvviewer.yaml
kubectl describe pod pvviewer
kubectl get pods
##################
kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}' > /root/CKA/node_ips
##################

kubectl run multi-pod  --image=nginx --dry-run=client -o yaml > multi-pod.yaml
vi multi-pod.yaml
kubectl apply -f multi-pod.yaml
kubectl run non-root-pod  --image=redis:alpine --dry-run=client -o yaml > non-root-pod.yaml
vi non-root-pod.yaml
kubectl apply -f non-root-pod.yaml
##################

kubectl get pod np-test-1 -o yaml
vi my-ingress.yaml
kubectl apply -f my-ingress.yaml
##################
kubectl taint nodes node01 env_type=production:NoSchedule
kubectl run dev-redis  --image=redis:alpine
kubectl run prod-redis --image=redis:alpine --dry-run=client -o yaml > prod-redis.yaml
vi prod-redis.yaml
kubectl apply -f prod-redis.yaml
kubectl get pods -o wide
##################

kubectl create ns hr
kubectl run hr-pod --image=redis:alpine -n hr
kubectl label pod hr-pod tier=frontend -n hr
kubectl label pod hr-pod environment=production  -n hr
cat .kube/config | grep -i controlplane
vi /root/CKA/super.kubeconfig
kubectl get pods -n kube-system
##################

kubectl edit pod kube-contro1ler-manager-controlplane -n kube-system
kubectl delete  pod kube-contro1ler-manager-controlplane -n kube-system
kubectl apply -f /tmp/kubectl-edit-103083158.yaml
kubectl get pods -n kube-system
sed -i 's/kube-contro1ler-manager/kube-controller-manager/g' /etc/kubernetes/manifests/kube-controller-manager.yaml
kubectl get pods -n kube-system
kubectl delete pod kube-controller-manager-controlplane --force -n kube-system
kubectl get pods -n kube-system
sed -i 's/kube-contro1ler-manager/kube-controller-manager/g' /etc/kubernetes/manifests/kube-controller-manager.yaml
kubectl get pods -n kube-system
kubectl scale deployment nginx-deploy --replicas=3
kubectl get pods


apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: prod-redis
  name: prod-redis
spec:
  containers:
  - image: redis:alpine
    name: prod-redis
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
  tolerations:
  - key: "env_type"
    value: "production"
    operator: "Equal"
    effect: "NoSchedule"

apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: multi-pod
  name: multi-pod
spec:
  containers:
  - image: nginx
    name: alpha
    env:
    - name: name
      value: "alpha"
  - image: busybox
    name: beta
    env:
    - name: name
      value: "beta"


apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  # "namespace" omitted since ClusterRoles are not namespaced
  name: pvviewer-role
rules:
  - apiGroups: [""]
    resources: ["persistentvolumes"]
    verbs: ["list"]

apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: pvviewer-role-binding
subjects:
  - kind: ServiceAccount
    name: pvviewer
    namespace: default

roleRef:
  kind: ClusterRole
  name: pvviewer-role
  apiGroup: rbac.authorization.k8s.io

apiVersion: v1
kind: Pod
metadata:
  labels:
    run: pvviewer
  name: pvviewer
spec:
  containers:
    - image: redis
      name: pvviewer
      resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
  serviceAccount: pvviewer

apiVersion: v1
kind: Pod
metadata:
  labels:
    run: multi-pod
  name: multi-pod
spec:
  containers:
    - image: nginx
      name: alpha
      env:
        - name: alpha

    - image: busybox
      name: beta
      command: ["sleep", "4800"]
      env:
        - name: beta



apiVersion: v1
kind: Pod
metadata:
  labels:
    run: non-root-pod
  name: non-root-pod
spec:
  containers:
    - image: redis:alpine
      name: non-root-pod
      resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
  securityContext:
    runAsUser: 1000
    fsGroup: 2000

kubectl get svc -o wide
NAME              TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)   AGE    SELECTOR
kubernetes        ClusterIP   10.96.0.1      <none>        443/TCP   36m    <none>
np-test-service   ClusterIP   10.106.6.225   <none>        80/TCP    2m8s   run=np-test-1

kubectl get service np-test-service -o yaml
apiVersion: v1
kind: Service
metadata:
  labels:
    run: np-test-1
  name: np-test-service
  namespace: default
spec:
  clusterIP: 10.106.6.225
  clusterIPs:
    - 10.106.6.225
  internalTrafficPolicy: Cluster
  ipFamilies:
    - IPv4
  ipFamilyPolicy: SingleStack
  ports:
    - port: 80
      protocol: TCP
      targetPort: 80
  selector:
    run: np-test-1
  sessionAffinity: None
  type: ClusterIP



#TODO ask why ne need network policy?


you did not fix the labels
run: np-test-1
they do not match be careful of label matchig

#TODO make sure to apply the taint that is provided in the question key value operation etc


kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}' > /root/CKA/node_ips

#Use the command kubectl scale to increase the replica count to 3.

kubectl scale deploy nginx-deploy --replicas=3
#The controller-manager is responsible for scaling up pods of a replicaset.
# If you inspect the control plane components in the kube-system namespace,
# you will see that the controller-manager is not running.

kubectl get pods -n kube-system
#The command running inside the controller-manager pod is incorrect.
#After fix all the values in the file and wait for controller-manager pod to restart.

#Alternatively, you can run sed command to change all values at once:

sed -i 's/kube-contro1ler-manager/kube-controller-manager/g' /etc/kubernetes/manifests/kube-controller-manager.yaml

kubectl get deploy


apiVersion: v1
kind: Pod
metadata:
  labels:
    run: prod-redis
  name: prod-redis
spec:
  containers:
    - image: redis:alpine
      name: prod-redis
      resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
  tolerations:
    - key: "env_type"
      operator: "Equal"
      value: "production"
      effect: "NoSchedule"
  nodeSelector:
    kubernetes.io/hostname: node01


apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: ingress-to-nptest
spec:
  podSelector:
    matchLabels:
      run: np-test-1
  policyTypes:
    - Ingress
  ingress:
    - ports:
        - port: 80
